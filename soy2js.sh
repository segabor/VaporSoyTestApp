SOY_BASE=./Resources/SoyTemplates
SOY_OUT=./Public/soy

if [ ! -d $SOY_BASE ]; then
  echo Missing Soy templates folder, aborting ...
  exit 1
fi

if [ ! -d $SOY_OUT ]; then
  mkdir -p $SOY_OUT
fi

java -jar Tools/Soy/lib/soy-2019-08-22-SoyToJsSrcCompiler.jar \
  --outputPathFormat ${SOY_OUT}/simple.js \
  --srcs ${SOY_BASE}/examples/simple.soy

