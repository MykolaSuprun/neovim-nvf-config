{ pkgs, ... }: {
  config.vim = {
    extraPackages = with pkgs; [ imagemagick luajitPackages.magick ueberzugpp ];
  };
}
