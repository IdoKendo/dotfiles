{ ... }:
{
  programs.ruff = {
    enable = true;
    settings = {
      line-length = 88;
      indent-width = 4;
      target-version = "py311";
      exclude = [
        ".bzr"
        ".direnv"
        ".eggs"
        ".git"
        ".git-rewrite"
        ".hg"
        ".ipynb_checkpoints"
        ".mypy_cache"
        ".nox"
        ".pants.d"
        ".pyenv"
        ".pytest_cache"
        ".pytype"
        ".ruff_cache"
        ".svn"
        ".tox"
        ".venv"
        ".vscode"
        "__pypackages__"
        "_build"
        "buck-out"
        "build"
        "dist"
        "node_modules"
        "site-packages"
        "venv"
      ];
      lint = {
        select = [
          "A"     #  builtins
          "ARG"   #  unsued arguments
          "ASYNC" #  async
          "B"     #  bugbear
          "C4"    #  comprehensions
          "E"     #  pycodestyle
          "F"     #  pyflakes
          "I"     #  isort
          "N"     #  pep8-naming
          "PT"    #  pytest style
          "RUF"   #  ruff
          "SIM"   #  simplify
          "TID"   #  tidy imports
          "UP"    #  pyupgrade
          "W"     #  warnings
        ];
        ignore = [];
        fixable = ["ALL"];
        unfixable = [];
        dummy-variable-rgx = "^(_+|(_+[a-zA-Z0-9_]*[a-zA-Z0-9]+?))$";
        isort.force-single-line = true;
        flake8-bugbear.extend-immutable-calls = [
          "fastapi.Depends"
          "fastapi.params.Depends"
          "fastapi.Query"
          "fastapi.params.Query"
        ];
      };
      format = {
        quote-style = "double";
        indent-style = "space";
        skip-magic-trailing-comma = true;
        line-ending = "auto";
        docstring-code-format = false;
        docstring-code-line-length = "dynamic";
      };
    };
  };
}
