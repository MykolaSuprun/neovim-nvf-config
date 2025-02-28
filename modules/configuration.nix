{ pkgs, lib, ... }: {
  config.vim = {
    telescope = {
      enable = true;
      setupOpts = { defaults = { path_display = [ "smart" ]; }; };
    };

    # #TODO: fix telescope preview scrolling
    # luaConfigRC.telescope = lib.nvim.dag.entryAfter [
    #   "lazyConfigs"
    #   "pluginConfigs"
    # ]
    # # lua
    #   ''
    #     local telescope = require('telescope')
    #     local actions = require('telescope.actions')
    #
    #     -- Retrieve the existing setup
    #     local existing_setup = telescope.setup
    #
    #     -- Define your custom mappings
    #     local custom_mappings = {
    #       i = {
    #         ["<C-j>"] = actions.preview_scrolling_down,
    #         ["<C-k>"] = actions.preview_scrolling_up,
    #       },
    #     }
    #
    #     -- Merge the custom mappings with the existing setup
    #     telescope.setup(vim.tbl_deep_extend("force", existing_setup, {
    #       defaults = {
    #         mappings = custom_mappings,
    #       }
    #     }))
    #
    #   '';

    git = {
      gitsigns = {
        enable = true;
        mappings = {
          diffProject = "<leader>dhD";
          diffThis = "<leader>dhd";
          previewHunk = "<leader>dhP";
          resetBuffer = "<leader>dhR";
          resetHunk = "<leader>dhr";
          stageBuffer = "<leader>hS";
          stageHunk = "<leader>hs";
          toggleBlame = "<leader>tb";
          toggleDeleted = "<leader>tD";
          undoStageHunk = "<leader>hu";
        };
      };
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    notes = { todo-comments.enable = true; };

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
        confirm = "<CR>";
        close = "<C-h>";
        scrollDocsDown = "<C-S-j>";
        scrollDocsUp = "<C-S-k>";
      };
    };
    spellcheck = { enable = true; };

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      nix = { enable = true; };
      markdown.enable = true;
      python = {
        enable = true;
        dap.enable = true;
        format = { type = "black-and-isort"; };
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

    comments = { comment-nvim.enable = true; };

    lsp = {
      enable = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      formatOnSave = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view = {
        enable = true;
        setupOpts.position = "bottom";
      };
      trouble = { enable = true; };
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

    projects = { project-nvim.enable = true; };

    utility = {
      surround.enable = true;
      diffview-nvim.enable = true;
      # images.image-nvim = {
      #   enable = true;
      #
      #   setupOpts = {
      #     backend = "kitty";
      #     processor = "magick_rock";
      #   };
      # };
      # motion.precognition.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; {
      oil-nvim = {
        package = oil-nvim;
        setup =
          # lua
          ''
            require("oil").setup({default_file_explorer = true})
          '';
      };
    };

    startPlugins = with pkgs.vimPlugins; [ oil-nvim ];

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
        key = "<leader>e";
        action =
          # lua
          ''
            function()
              require("oil").toggle_float(require("oil").get_current_dir())
            end
          '';
        lua = true;
        mode = "n";
        desc = "Toggle file explorer";
      }
      {
        key = "<leader>f/";
        action =
          # lua
          ''
            function()
              require("telescope.builtin").current_buffer_fuzzy_find()
            end
          '';
        lua = true;
        mode = "n";
        desc = "Fuzzy find current buffer";
      }
    ];
    options = { backupdir = ".neovimtmp//"; };
  };
}
