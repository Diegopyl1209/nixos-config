{
  self,
  inputs,
  isNixOS,
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
      inherit self inputs host isNixOS username userfullname useremail pkgsStable;
    };

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

    nixosModulesImports =
      [
        ./${host} # host specific configuration
        ./${host}/hardware-configuration.nix # host specific hardware configuration
        ../modules
        #../pkgs
        #../options/nixos
      ]
      ++ homeManagerModule;

    homeManagerImports = [
      ./${host}/home.nix # host specific home-manager configuration
      ../home
      #../options/home
      #inputs.stylix.homeManagerModules.stylix # TODO: move all inputs modules to their respective modules
      #inputs.nixvim.homeManagerModules.nixvim
      #inputs.base16.nixosModule
    ];
  in
    if isNixOS
    then
      lib.nixosSystem {
        specialArgs = extraSpecialArgs;
        modules = nixosModulesImports;
      }
    else
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs;
        modules = homeManagerImports;
      };
in
  builtins.listToAttrs (map (host: {
    name =
      if isNixOS
      then "${host}"
      else "${username}@${host}";
    value = mkHost host;
  }) ["desktop" "laptop" "server"])
