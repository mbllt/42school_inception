#Wordpress CMS
#	Content Management System : cest une appli web qui permet
# de controler le contenu de notre site sans coder

#Nginx
#	Web server

#MariaDB
#	Gestionnaire de base de donnes


#-------------------------VAR------------------------
VOLUMES_HOST	= /home/mballet/data/html /home/mballet/data/mysql
PATH_YML		= -f ./srcs/docker-compose.yml
include ./srcs/.env
#----------------------------------------------------


#-------------------DOCKER-COMPOSE-------------------
all: $(VOLUMES_HOST)
	docker-compose $(PATH_YML) up --build

$(VOLUMES_HOST):
	sudo mkdir -p $@

down:
			docker-compose $(PATH_YML) down --remove-orphans
			docker images prune
stop:
			docker-compose $(PATH_YML) stop
#----------------------------------------------------


#----------------------SERVICES----------------------
db:
			docker exec -it mariadb bash
wp:
			docker exec -it wordpress bash
nginx:
			docker exec -it nginx bash
#----------------------------------------------------


#---------------------CLEAN RULES--------------------
clean:
			-docker-compose $(PATH_YML) down --remove-orphans

v_clean:
			-docker volume rm $$(docker volume ls -q)

fclean:		clean v_clean
			-docker rm -f $$(docker ps -a -q)
			-docker rmi -f $$(docker images -aq)
			-sudo rm -rf $(VOLUMES_HOST)	
			docker system prune -af
re:			fclean all
#----------------------------------------------------


#-----------------------COLORS-----------------------
GREEN	= \033[32m
END		= \033[0m
BOLD	= \033[1m
#----------------------------------------------------