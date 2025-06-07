# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ../../../common/cpu/intel
      # ../../../common/pc/laptop
      # ../../../common/pc/laptop/ssd
    ];

  boot.kernelParams = [ 
    # needed for Intel Iris Xe
    "i915.force_probe=46a8"
    "i915.enable_guc=3"
    "i915.fastboot=1"
    # needed for keyboard
    "i8042.dumbkbd=1" 
    "i8042.nopnp=1" 
  ];
  # services.xserver.videoDrivers = lib.mkDefault [ "intel" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Costa_Rica";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.flatpak.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
      #vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      intel-media-sdk   # for older GPUs
      vaapiVdpau
      libvdpau-va-gl
    ];
    bluetooth.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.daniel = {
    isNormalUser = true;
    description = "Daniel";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    # packages = with pkgs; [
    #  thunderbird
    # ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    htop
    floorp
    wezterm
    ripgrep
    ripgrep-all
    git
    lunarvim
    zsh
    oh-my-zsh
    zsh-nix-shell
    atuin
    rustc
    cargo
    clang
    gcc
    wget
    curl
    nodejs_22
    openssh
    zsh-autosuggestions
    thefuck
    slack
    slack-term
    helix
    docker
    solaar
    micromamba
    steam
    neofetch
    zathura
    tree
    tmux
    ngspice
    cmatrix
    google-chrome
    google-cursor
    tgpt
    gamemode
    mangohud
    protonup
    nh
    nix-output-monitor
    nvd
    python3
  ];


  # enable docker
  virtualisation.docker.enable = true;
  # use docker without Root access (Rootless docker)
  virtualisation.docker.rootless = {
   enable = true;
   setSocketVariable = true;
  };


  services.atuin = {
    enable = true;
  };

  programs.bash = {
    interactiveShellInit = ''
      eval "$(atuin init bash)"
    '';
  };

  # micromamba

  environment.variables = {
    MAMBA_ROOT_PREFIX = "/home/user/micromamba";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.steam.enable=true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/user/.steam/root/compatibilitytools.d";
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # zsh and oh-my-zsh config
  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    # syntaxHighlighting.enable = true;

    # shellAliases = {
    #   ll = "ls -l";
    #   update = "sudo nixos-rebuild switch";
    # };
    # history = {
    #   size = 10000;
    #   path = "${config.xdg.dataHome}/zsh/history";
    # };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck" ];
      theme = "robbyrussell";
    };
    # autosuggestion.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/settings-daemon/plugins/media-keys" = {
            area-screenshot = [ "<Primary><Shift>Print" ];
          };
        };
        lockAll = true;
      }
    ];
  };
}

