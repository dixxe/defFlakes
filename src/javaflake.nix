{
  description = "A dev env flake for java";

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
        jdk17
        glfw
        jetbrains.idea-community-bin
        gradle
      ];

      shellHook = ''
        echo welcome to java env!
        export LD_LIBRARY_PATH="''${LD_LIBRARY_PATH}''${LD_LIBRARY_PATH:+:}${pkgs.libglvnd}/lib"
      '';

      };
    
  };

  };
}
