{config, ...}: let
data_folder = "${config.server.dataDir}/overleaf";
in {
  virtualisation.oci-containers.containers = {
    mongooverleaf = {
      image = "mongo:6.0";
      cmd = [ "--replSet overleaf" ];
      volumes = [
        "${data_folder}/mongo_data:/data/db"
        "${data_folder}/server-ce/mongodb-init-replica-set.js:/docker-entrypoint-initdb.d/mongodb-init-replica-set.js"
      ];
      environment = {
        MONGO_INITDB_DATABASE = "sharelatex";
      };
      extraOptions = [ "--add-host=mongo:127.0.0.1" ];
    };
    redisoverleaf = {
      image = "redis:6.2";
      volumes = [
        "${data_folder}/redis:/data"
      ];
    };
    overleaf = {
      image = "sharelatex/sharelatex";
      dependsOn = [ "redisoverleaf" "mongooverleaf" ];
      ports = [
        "8333:80"
      ];
      volumes = [
        "${data_folder}/sharelatex_data:/var/lib/overleaf"
      ];
      environment = {
        OVERLEAF_APP_NAME = "Overleaf Community Edition";
        OVERLEAF_MONGO_URL = "mongodb://mongo/sharelatex";
        OVERLEAF_REDIS_HOST = "redis";
        REDIS_HOST = "redis";
        ENABLED_LINKED_FILE_TYPES = "project_file,project_output_file";
        ENABLE_CONVERSIONS = "true";
        # idk if this works
        SANDBOXED_COMPILES = "true";
        SANDBOXED_COMPILES_SIBLING_CONTAINERS = "true";
        SANDBOXED_COMPILES_HOST_DIR = "/home/user/sharelatex_data/data/compiles";
      };
    };
    
    
  };
}
