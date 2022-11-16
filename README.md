# Dreambooth on 8GB GPU

This repository provides configuration example to use the https://github.com/huggingface/diffusers/tree/main/examples/dreambooth example on a RTX3060TI in Win 10 WSL.

## Setup
### Prerequisites
Python: 3.10.8 - Use Virtualenv
CUDA Toolkit - https://docs.nvidia.com/cuda/wsl-user-guide/index.html

### Install
```bash
python -r requirements.txt
```

## Dreambooth

Configure the following parameters in the Makefile.

* MODEL_NAME, default "./models/stable-diffusion-v1-5".
    You need to provide your own model, you can download stable diffusion from hugging face here: https://huggingface.co/runwayml/stable-diffusion-v1-5
* INSTANCE_DIR, default "./train_input"
* CLASS_DIR, default "./train_class"
* OUTPUT_DIR, default "./train_output"
* PROMPT, default  "a photo of sks dog"
* CLASS_PROMPT, default  "a photo of dog"
* RESOLUTION, default  512

Run the following command to start training with your parameters.
```bash
make train
```

You can also provide the parameters directly on the terminal.
```bash
PROMPT="<your training prompt>" CLASS_PROMPT="<class image prompt>" RESOLUTION=<your resolution> MODEL_NAME=<your model location> INSTANCE_DIR=<your training input files> CLASS_DIR=<class training files> OUTPUT_DOR=<your model output> 
```