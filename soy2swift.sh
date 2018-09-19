SOY_BASE=./Resources/SoyTemplates
SOY_OUT=./Sources/Soy

if [ ! -d $SOY_BASE ]; then
  echo Missing Soy templates folder, aborting ...
  exit 1
fi

if [ ! -d $SOY_OUT ]; then
  mkdir -p $SOY_OUT
fi

java -jar Tools/Soy/lib/soy-2018-03-14-SoyToSwiftSrcCompiler.jar \
  --outputPathFormat ${SOY_OUT}/Examples/Simple.swift \
  --srcs ${SOY_BASE}/examples/simple.soy
