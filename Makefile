SHELL := /bin/bash

MODEL_BACKUP_DIR := model-backups
MODEL_BACKUP_SOURCES := assets/blender/sources assets/blender/exports assets/blender/textures assets/blender/previews assets/blender/references apps/arms-game/assets/weapons
MODEL_BACKUP_TIMESTAMP := $(shell date +%Y%m%d-%H%M%S)
MODEL_BACKUP_FILE := $(MODEL_BACKUP_DIR)/$(MODEL_BACKUP_TIMESTAMP)-blender-models.zip

.PHONY: backup-models list-model-backups clean-empty-model-backups

backup-models:
	@mkdir -p "$(MODEL_BACKUP_DIR)"
	@echo "Creating $(MODEL_BACKUP_FILE)"
	@zip -r "$(MODEL_BACKUP_FILE)" $(MODEL_BACKUP_SOURCES) \
		-x '*/.gitkeep' \
		-x '*/.DS_Store' \
		-x '*.blend1' \
		-x '*.blend2' \
		-x '*.blend@' \
		-x '*.blend~' \
		-x '*.tmp'
	@echo "Done: $(MODEL_BACKUP_FILE)"
	@echo "Next: upload this archive to your cloud drive manually."

list-model-backups:
	@mkdir -p "$(MODEL_BACKUP_DIR)"
	@find "$(MODEL_BACKUP_DIR)" -maxdepth 1 -type f -name '*-blender-models.zip' -print | sort -r

clean-empty-model-backups:
	@find "$(MODEL_BACKUP_DIR)" -maxdepth 1 -type f -name '*-blender-models.zip' -size 22c -delete
