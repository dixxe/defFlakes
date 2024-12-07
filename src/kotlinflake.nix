{
  description = "A dev env flake for kotlin";

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
        kotlin
        gradle
      ];

      shellHook = ''
        echo welcome to kotlin env!
      '';

      };
    
  };

  };
}
