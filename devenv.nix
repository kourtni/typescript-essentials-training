{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "LinkedIn Learning's TypeScript Essential Training (with Nix)";

  # https://devenv.sh/packages/
  packages = [
    pkgs.nodejs
    pkgs.corepack # Adds pnpm and yarn support
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo Welcome to $GREET";

  enterShell = ''
    hello
    echo This shell provides the following dev tooling:
    echo node:
    node --version
    echo TypeScript tsc:
    tsc --version
    echo pnpm:
    pnpm --version
  '';

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep "2.42.0"
  # '';

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  languages.typescript.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
