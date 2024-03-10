{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.ssm = {
    isNormalUser = true;
    home = "/home/ssm";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    # hashedPassword = "$6$p5nPhz3G6k$6yCK0m3Oglcj4ZkUXwbjrG403LBZkfNwlhgrQAqOospGJXJZ27dI84CbIYBNsTgsoH650C1EBsbCKesSVPSpB1";
    initialPassword = "test";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeb94wNPZ6TIU7wYPHhHxjVP+beiYqkTXrelNlFVklVw9Cs9reVNtg6yDdZH5s4/GZamx89SBxmVkUKrBkFG0inlac2HIi6hhx5w+F8cP0tItZkmK1cTZpBCfnnVgbP1vd4MfHd6hRQ/sxkEtE9SUGxSXDzAjTI5tNJ9po9Iyk/VgKpfcTCFaOZN0SSYnVvtaYqkDYJeD6YAmqMMdN8YwHeLcWRjKQxw8jv4wcVBfJ61r2WCmMBhZDiXFOiysDBBmyOTD+vMBq0PTP+tzmbsaynYEtIyFWqsTAjCRgcNADsxTTD1kthLA+3+9cq7hlEVT71JJDDi16+tKNK34jDSQKENA7Rg6XhNusAc/CxXFdO5xgC5S4O8HMuGM1UStS1to8Fix7ZFl9eywVJpp2B0DRKwFJ0zDDH/uFEI/eGruI5Yn1q9jHrXnjfUW4gcvr81tmpsnRe3x/9wwpCD6toQVIxWlQQB15wOy4Y5AncVDZ107xKcYn9PhIt2Q9R/jGhlU= ssm@clv-mba-m1.local"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
