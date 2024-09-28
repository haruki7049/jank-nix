{
  clangStdenv,
  fetchgit,
  lib,
  cmake,
  ninja
}:

clangStdenv.mkDerivation {
  pname = "jank";
  version = "0-unstable-2024-09-07";

  src = fetchgit {
    url = "https://github.com/jank-lang/jank";
    rev = "e774da6e3d029c884caefa5c27922b25713b24f7";
    hash = "sha256-ePnFT0myTMNfDXouvjqzWAvDys7QLBlQSH8J0UO8Ps4=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];

  configurePhase = ''
    cmake -S $src/compiler+runtime -GNinja
  '';

  meta = {
    description = "A Clojure dialect hosted on LLVM with native C++ interop";
    homepage = "https://github.com/jank-lang/jank/";
    license = lib.licenses.mpl20;
    platforms = [ "x86_64-linux" ];
  };
}
