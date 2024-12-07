{
  description = "A dev env flake for C#";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
  devShells.${system} = {
    default =  pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        dotnet-sdk_8
        dotnetPackages.Nuget
      ];

      shellHook = ''
        echo welcome to dotnet env!
      '';

      };
    
  };

  };
}
