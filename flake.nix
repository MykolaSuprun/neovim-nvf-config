{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    packages."x86_64-linux" = let
      lib = inputs.nvf.lib;
      neovimConfigured = inputs.nvf.lib.neovimConfiguration {
        inherit (nixpkgs.legacyPackages."x86_64-linux") pkgs;
        modules = [
          ./modules/configuration.nix
          ./modules/visual.nix
          ./modules/extra_pkgs.nix
        ];
      };
    in {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default = neovimConfigured.neovim;
    };
  };
}
