{ inputs
, mkYarnPackage
}:
(mkYarnPackage {
  name = "powercord-unwrapped";
  src = inputs.powercord;
  yarnLock = "${inputs.self}/misc/yarn.lock";

  patches = [ ../misc/powercord.patch ];

  installPhase = ''
    runHook preInstall

    mv deps/powercord $out
    rm $out/node_modules

    runHook postInstall
  '';

  meta = {
    homepage = "https://powercord.dev";
    license = "unfree";
  };
}).overrideAttrs (_: {
  doDist = false;
})
