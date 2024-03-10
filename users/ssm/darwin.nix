{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];

  homebrew = {
    enable = true;
    casks  = [
      "activitywatch"
      "bitwarden-cli"
      "cleanshot"
      "discord"
      "github"
      "google-chrome"
      "hammerspoon"
      "imageoptim"
      "istat-menus"
      "iterm2"
      "jetbrains-toolbox"
      "monodraw"
      "notion"
      "obsidian"
      "raycast"
      "rectangle"
      "screenflow"
      "slack"
      "spotify"
      "stats"
      "steam"
      "visual-studio-code"
      "warp"
      # "1password"
      # "bitwarden"
      # "docker"
    ];
  };

  # The user should already exist, but we need to set this up so Nix knows
  # what our home directory is (https://github.com/LnL7/nix-darwin/issues/423).
  users.users.ssm = {
    home = "/Users/ssm";
    shell = pkgs.zsh;
  };
}
