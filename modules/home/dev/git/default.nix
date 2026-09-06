{
  gitUser,
  gitEmail,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = gitUser;
        email = gitEmail;
      };
      init.defaultBranch = "main";
      merge.ours.driver = true;
    };
  };
  programs.lazygit.enable = true;
}
