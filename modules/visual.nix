{pkgs, ...}: let
  theme = "catppuccin";
in {
  config.vim = {
    luaConfigPost =
      /*
      lua
      */
      ''
        local colorscheme = vim.env.SYS_THEME or "catppuccin-mocha"
        vim.cmd("colorscheme " .. colorscheme)
      '';
    options = {
      # use spaces instead of tabs
      expandtab = true;
      # set tab lenght and indent shift to 2
      tabstop = 2;
      shiftwidth = 2;
      # round indents
      shiftround = true;
    };
    theme = {
      enable = true;
      name = "${theme}";
      style = "mocha";
      transparent = false;
    };

    ui = {
      noice = {enable = true;};
      fastaction.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          nix = "110";
          python = "79";
          java = "130";
          go = ["90" "130"];
        };
      };

      # borders.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
    };
    statusline.lualine = {
      enable = true;
      theme = "${theme}";
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline = {
        enable = true;
        setupOpts = {
          cursorword = {
            enable = true;
            hl.underline = true;
          };
        };
      };
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      cellular-automaton.enable = true;
    };

    notify = {
      nvim-notify = {
        enable = true;
        setupOpts.timeout = 2000;
      };
    };
  };
}
