LINE===================================================
HELP_SIZE=20
COMPOSER_PATH?="./docker-compose.yml"

.PHONY: help
help:
	@echo "Usage: make [target]\n"



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