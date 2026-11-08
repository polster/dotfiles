#!makefile

VSCODE_DIR := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))
COMPOSE_CMD := docker compose -f $(VSCODE_DIR)/docker-compose.yaml

.PHONY: vscode-settings-%
vscode-settings-%:
	$(VSCODE_DIR)/vscode_settings.sh $*

.PHONY: vscode-compose-start
vscode-compose-start:
	$(COMPOSE_CMD) up -d

.PHONY: vscode-compose-stop
vscode-compose-stop:
	$(COMPOSE_CMD) down

.PHONY: vscode-compose-restart
vscode-compose-restart: vscode-compose-stop vscode-compose-start

.PHONY: vscode-compose-status
vscode-compose-status:
	$(COMPOSE_CMD) ps

.PHONY: vscode-compose-logs
vscode-compose-logs:
	$(COMPOSE_CMD) logs -f
