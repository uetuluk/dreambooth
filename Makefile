help: ## display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | sort | awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

PROMPT ?= "a photo of sks dog"
RESOLUTION ?= 512

train: ## run the train command
	@accelerate launch train_dreambooth.py \
		--pretrained_model_name_or_path=$(MODEL_NAME)  \
		--instance_data_dir=$(INSTANCE_DIR) \
		--output_dir=$(OUTPUT_DIR) \
		--instance_prompt="$(PROMPT)" \
		--resolution=$(RESOLUTION) \
		--train_batch_size=1 \
		--gradient_accumulation_steps=1 \
		--learning_rate=5e-6 \
		--lr_scheduler="constant" \
		--lr_warmup_steps=0 \
		--max_train_steps=400