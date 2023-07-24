{ pkgs, home-manager, user, ... }:

{
  home-manager.users.${user} = {
    home.file.".config/1Password/ssh/agent.toml".text = ''
      # This is the 1Password SSH agent config file, which allows you to customize the
      # behavior of the SSH agent running on this machine.
      #
      # You can use it to:
      # * Enable keys from other vaults than the Private vault
      # * Control the order in which keys are offered to SSH servers
      #
      # EXAMPLE
      #
      # By default, all keys in your Private vault(s) are enabled:
      #
      #  [[ssh-keys]]
      #  vault = "Private"
      #
      # You can enable more keys by adding more `[[ssh-keys]]` entries.
      # For example, to first enable item "My SSH Key" from "My Custom Vault":
      #
      #  [[ssh-keys]]
      #  item = "My SSH Key"
      #  vault = "My Custom Vault"
      #
      #  [[ssh-keys]]
      #  vault = "Private"
      #
      # You can test the result by running:
      #
      #  SSH_AUTH_SOCK=~/.1password/agent.sock ssh-add -l
      #
      # More examples can be found here:
      #  https://developer.1password.com/docs/ssh/agent/config
      [[ssh-keys]]
      vault = "Private"
    '';
  };

  environment.sessionVariables = {
    SSH_AUTH_SOCK = "~/.config/1Password/ssh/agent.sock";
  };

  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ user ];
      package = pkgs._1password-gui; # or pkgs._1password-beta-gui
    };
    _1password = {
      enable = true;
    };
  };
}
