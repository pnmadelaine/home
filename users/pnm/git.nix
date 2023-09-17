{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Paul-Nicolas Madelaine";
    userEmail = "pnm@pnm.tf";
    ignores = [
      # nix
      "result"
      "result-*"
      "build-env"
      "build-env-*"

      # cmake
      "CMakeCache.txt"
      "CMakeFiles"
      "cmake_install.cmake"

      # python
      "__pycache__"

      # misc
      "*.swp"
      "*~"
      ".direnv"
      ".envrc"
    ];
    extraConfig = { init = { defaultBranch = "main"; }; };
  };
}
