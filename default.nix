{
  stdenv,
  fetchFromGitHub,
  lib,
  bash,
  cmake,
}:

stdenv.mkDerivation rec {
  pname = "jank";
  version = "0-unstable-2024-09-07";

  src = fetchFromGitHub {
    owner = "jank-lang";
    repo = pname;
    rev = "e774da6e3d029c884caefa5c27922b25713b24f7";
    hash = "sha256-oyeHDjVqUDxWB4xI5zbO0Q6HjugKLKbKMi+T7Vf8LsY=";
  };

  nativeBuildInputs = [
    bash
    cmake
  ];

  configurePhase = ''
  '';

  meta = {
    description = "A Clojure dialect hosted on LLVM with native C++ interop";
    homepage = "https://github.com/jank-lang/jank/";
    license = lib.licenses.mpl20;
    platforms = [ "x86_64-linux" ];
  };
}
