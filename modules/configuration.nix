{pkgs, ...}: let
  theme = "catppuccin";
in {
  config.vim = {
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

      borders.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
    };
    statusline.lualine = {
      enable = true;
      theme = "${theme}";
    };

    telescope = {enable = true;};

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
    };

    notify = {
      nvim-notify = {
        enable = true;
        setupOpts.timeout = 2000;
      };
    };

    filetree = {neo-tree = {enable = true;};};

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    notes = {
      todo-comments.enable = true;
    };

    autopairs.nvim-autopairs.enable = true;
    snippets.luasnip.enable = true;
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        # "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item())";
        # "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item())";
        # "<C-h>" = "cmp.mapping.abort()";
        # "<C-l>" = "cmp.mapping.confirm()";
        # "<C-f>" = "cmp.mapping.scroll_docs(4)";
        # "<CR>" = "cmp.mapping.confirm({ select = false })";
        next = "<C-j>";
        previous = "<C-k>";
        confirm = "<C-l>";
        close = "<C-h>";
        scrollDocsDown = "<C-S-j>";
        scrollDocsUp = "<C-S-k>";
      };
    };
    spellcheck = {enable = true;};

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      nix = {enable = true;};
      markdown.enable = true;
      python = {
        enable = true;
        dap.enable = true;
        format = {type = "black-and-isort";};
      };
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      java.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = true;
      rust = {
        enable = true;
        crates.enable = true;
      };
      nu.enable = true;
      scala.enable = true;
      elixir.enable = true;
      haskell.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };

    lsp = {
      enable = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      formatOnSave = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      lsplines.enable = true;
      nvim-docs-view = {
        enable = true;
        setupOpts.position = "bottom";
      };
      trouble = {enable = true;};
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    treesitter = {
      enable = true;
      highlight.enable = true;
      context.enable = true;
      incrementalSelection.enable = true;
      indent.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    utility = {
      surround.enable = true;
      diffview-nvim.enable = true;
      motion.precognition.enable = true;
    };

    lazy.plugins = {
      "actions-preview.nvim" = {
        package = pkgs.vimPlugins.actions-preview-nvim;
        setupModule = "actions-preview";
        setupOpts = {
          telescope = {
            sorting_strategy = "ascending";
            layout_strategy = "vertical";
            layout_config = {
              width = 0.8;
              height = 0.9;
              prompt_position = "top";
              preview_cutoff = 20;
            };
          };
        };
        lazy = true;
        # load on event
        # event = [ "BufEnter" ];
        # load on keymap
        keys = [
          {
            key = "<leader>ca";
            action = '':lua require("actions-preview").code_actions()<CR>'';
            mode = ["n" "v"];
            desc = "Code actions";
          }
        ];
      };
    };
    binds = {
      whichKey = {
        enable = true;

        register = {
          "<leader>c" = "Code...";
          "<leader>d" = "Debug..";
        };
      };
      cheatsheet.enable = true;
    };
    keymaps = [
      {
        key = "<leader>E";
        mode = ["n" "v"];
        action = ":Neotree toggle=true reveal=true<CR>";
        silent = true;
        desc = "Toggle Neotree";
      }
    ];
    options = {backupdir = ".neovimtmp//";};
  };
}
