FROM bvlc/caffe:cpu

RUN pip install tensorflow

CMD ./convert.py  \
    --caffemodel "${MODEL_NAME}.caffemodel" \
    --data-output-path "converted/${MODEL_NAME}.npy" \
    --code-output-path "converted/${MODEL_NAME}.py" \
    "${MODEL_NAME}.prototxt"
