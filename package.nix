{ inputs, ... }:
{
  perSystem =
    {
      pkgs,
      self',
      lib,
      ...
    }:
    let
      inherit (pkgs.vimUtils) buildVimPlugin;
      config = self'.packages.nvx-config;
      fs = lib.fileset;

      buffer-sticks-nvim = buildVimPlugin {
        name = "buffer-sticks.nvim";
        src = inputs.buffer-sticks-nvim;
      };
      direnv-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "direnv.nvim";
        src = inputs.direnv-nvim;
      };
      tree-sitter-manager-nvim = buildVimPlugin {
        name = "tree-sitter-manager.nvim";
        src = inputs.tree-sitter-manager-nvim;
      };
    in
    {
      packages.default = self'.packages.nvx;
      packages.nvx = inputs.mnw.lib.wrap pkgs {
        appName = "nvx";
        luaFiles = [ "${config}/init.lua" ];

        extraBinPath = with pkgs; [
          tree-sitter
          stdenv.cc
        ];

        plugins.dev.nvx = {
          pure = config;
          impure = "/home/$(whoami)/Projects/nvx";
        };

        plugins.opt = with pkgs.vimPlugins; [
          #
          # general
          #
          hotpot-nvim
          mini-nvim
          snacks-nvim

          #
          # ui
          #
          which-key-nvim
          tabby-nvim
          lualine-nvim
          oxocarbon-nvim

          #
          # editor
          #
          langmapper-nvim
          leap-nvim
          vim-repeat
          nvim-autopairs
          neotab-nvim
          tree-sitter-manager-nvim
          nvim-treesitter-context
          nvim-treesitter-textobjects
          quicker-nvim
          parinfer-rust
          direnv-nvim

          #
          # navigation
          #
          oil-nvim
          project-nvim
          buffer-sticks-nvim

          #
          # code
          #
          nvim-lspconfig
          gitsigns-nvim
          neogit
          diffview-plus-nvim
          blink-cmp
          colorful-menu-nvim
          conform-nvim
          nvim-lightbulb
          nvim-colorizer-lua

          #
          # filetype-specific
          #
          typst-preview-nvim
        ];

        # don't add unused deps
        plugins.startAttrs = {
          plenary-nvim = null;
          nvim-treesitter = null;
        };
      };

      packages.nvx-config = pkgs.stdenvNoCC.mkDerivation {
        name = "nvx-lua";
        src = fs.toSource {
          root = ./.;
          fileset = fs.unions [
            ./after
            ./fnl
            ./init.fnl
          ];
        };

        nativeBuildInputs = with pkgs; [
          luaPackages.fennel
        ];

        dontUnpack = true;
        dontConfigure = true;

        buildPhase = ''
          runHook preBuild

          find $src -name '*.fnl' -print0 | while IFS= read -r -d "" fnlfile; do
            outdir="$out/''${fnlfile#$src/}"
            outfile="''${outdir//fnl/lua}"
            mkdir -p "$(dirname $outfile)"
            fennel --add-macro-path $src/fnl/lib/macro.fnlm --compile "$fnlfile" > "$outfile"
          done

          runHook postBuild
        '';
      };
    };
}
