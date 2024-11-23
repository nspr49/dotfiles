{ pkgs, config, ...}:
{

  virtualisation.containers.enable = true;
  virtualisation= {
    podman = {
      enable=true;
    };
    docker= {
      enable = true;
      package= pkgs.docker_27;
    };


  };

}
