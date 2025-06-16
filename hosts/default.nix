{
  self,
  inputs,
  lib,
  system,
  username,
  userfullname,
  useremail,
  ...
}: let
  mkHost = host: let
    pkgsStable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    extraSpecialArgs = {
      inherit self inputs host username userfullname useremail pkgsStable;
    };

    homeManagerImports = [
      ./${host}/home.nix # host specific home-manager configuration
      ../home
    ];

    nixosModulesImports =
      [
        ./${host} # host specific configuration
        ./${host}/hardware-configuration.nix # host specific hardware configuration
        ../modules
      ]
      ++ homeManagerModule;

    homeManagerModule = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "back";

          inherit extraSpecialArgs;

          users.${username}.imports = homeManagerImports;
        };
      }
      # alias for home-manager
      (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username])
    ];
  in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;
      modules = nixosModulesImports;
    };
in
  builtins.listToAttrs (map (host: {
    name ="${host}";
    value = mkHost host;
  }) ["desktop" "laptop" /*"server"*/])
