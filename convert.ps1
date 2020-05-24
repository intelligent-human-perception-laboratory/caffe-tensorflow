if ($args.Count -ne 1) {
	echo "Usage: $PSCommandPath model_name"
	exit
}
$model_name = $args[0]
if (-not (Test-Path "${model_name}.prototxt" -PathType leaf)) {
	echo "model file ${model_name}.prototxt not found in current directory"
	exit
}
if (-not (Test-Path "${model_name}.caffemodel" -PathType leaf)) {
	echo "model file ${model_name}.caffemodel not found in current directory"
	exit
}
$id = $(docker build -q .)
echo "image digest $id"
docker run -v ${pwd}:/workspace -ti -e "MODEL_NAME=$model_name" $id

if ($?) {
	echo "Check 'converted' directory"
}