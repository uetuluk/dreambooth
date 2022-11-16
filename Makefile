help: ## display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | sort | awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

PROMPT ?= "a photo of sks dog"
CLASS_PROMPT ?= "a photo of dog"
RESOLUTION ?= 512

train: ## run the train command
	@accelerate launch train_dreambooth.py \
		--pretrained_model_name_or_path=$(MODEL_NAME)  \
		--instance_data_dir=$(INSTANCE_DIR) \
		--class_data_dir=$(CLASS_DIR) \
		--output_dir=$(OUTPUT_DIR) \
		--with_prior_preservation --prior_loss_weight=1.0 \
		--instance_prompt="$(PROMPT)" \
		--class_prompt="$(CLASS_PROMPT)" \
		--resolution=$(RESOLUTION) \
		--train_batch_size=1 \
		--sample_batch_size=1 \
		--gradient_accumulation_steps=1 --gradient_checkpointing \
		--learning_rate=5e-6 \
		--lr_scheduler="constant" \
		--num_class_images=200 \
		--lr_warmup_steps=0 \
		--max_train_steps=800 \
		--mixed_precision=fp16