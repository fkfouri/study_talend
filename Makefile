LINE===================================================
HELP_SIZE=20
COMPOSER_PATH?="./docker-compose.yml"
IMAGE_NAME?=image_to_run
DOCKERFILE?="./dockerfile"

.PHONY: help
help:
	@echo "Usage: make [target]\n"

#################################################################################
# --- Git
#################################################################################
git_config_wsl: ## configura o git
	git config --global user.name "Fulano"
	git config --global user.email "fulano@suzano.com.br"

git_back: ## volta um commit
	git log -n 1
	git reset --soft HEAD~1

git_remote_update: ## atualiza a lista de repositórios remotos
	git remote update origin --prune

#################################################################################
# COMPOSE																		#
#################################################################################
compose_up: 
	docker-compose -f $(COMPOSER_PATH) up -d

compose_rebuild: 
	docker-compose -f $(COMPOSER_PATH) up -d --build

compose_down: 
	docker-compose -f $(COMPOSER_PATH) down

compose_down_clean: 
	docker-compose -f $(COMPOSER_PATH) down --rmi all

compose_exec: #Executa o modelo pelo container
	docker-compose -f $(COMPOSER_PATH) exec baquara_model make run

compose_bash:
	docker exec -it  baquara_model bash

compose_sh:
	docker exec -it  baquara_model_wheel bash	

#################################################################################
# --- Docker Build
#################################################################################
build: ## Build docker image
	-docker build -t ${IMAGE_NAME} -f $(DOCKERFILE) .

__docker_run:
	-docker run --rm $(OPTIONS) -v $(PWD):/local/ --name ${IMAGE_NAME} ${IMAGE_NAME} $(CMD)

run: ## Run docker
	@make __docker_run CMD="" OPTIONS="-d"

bash: ## Run docker iterative bash
	@make __docker_run CMD="bash" OPTIONS="-it"

sh: ## Run docker iterative sh
	@make __docker_run CMD="sh" OPTIONS="-it"

mysql:
	@echo rodar "SOURCE /local/sakila-schema.sql; SOURCE /local/sakila-data.sql;"
	docker exec -it mysql_container mysql -u root -p"root"