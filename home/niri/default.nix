{
  config,

  ...
}:

{
  imports = [

  ];

  options = {

  };

  config = {
    home.file.".config/niri" = {
      source = ./configs;
      recursive = true;
    };
  };

}
