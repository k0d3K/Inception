#==================== PARAM =====================#

LOGIN			=	$(USER)
DISPLAY_TRACKER	:=	.display_done
UP_TRACKER		:=	.up_done
COMPOSE_BAKE	=	true

#==================== COLOR =====================#

RESET			:=	\e[0m
BLACK			:=	\e[30m
RED				:=	\e[31m
GREEN			:=	\e[32m
YELLOW			:=	\e[33m
BLUE			:=	\e[34m
MAGENTA			:=	\e[35m
CYAN			:=	\e[36m

#===================== RULE =====================#

all		: up

$(DISPLAY_TRACKER):
		echo
		echo "  ______                                       __ "
		echo " /\\__  _\\                                     /\\ \\__   __ "
		echo " \\/_/\\ \\/      ___      ___      __    _____  \\ \\ ,_\\ /\\_\\     ___     ___ "
		echo "    \\ \\ \\    /' _ \`\\   /'___\\  /'__\`\\ /\\ '__\`\\ \\ \\ \\/ \\/\\ \\   / __\`\\ /' _ \`\\ "
		echo "     \\_\\ \\__ /\\ \\/\\ \\ /\\ \\__/ /\\  __/ \\ \\ \\L\\ \\ \\ \\ \\_ \\ \\ \\ /\\ \\L\\ \\/\\ \\/\\ \\ "
		echo "     /\\_____\\\\\ \\_\\ \\_\\\\\ \\____\\\\\\ \\____\\ \\ \\ ,__/  \\ \\__\\ \\ \\_\\\\\ \\____/\\ \\_\\ \\_\\ "
		echo "     \\/_____/ \\/_/\\/_/ \\/____/ \\/____/  \\ \\ \\/    \\/__/  \\/_/ \\/___/  \\/_/\\/_/ "
		echo "                                         \\ \\_\\ "
		echo "                                          \\/_/"
		echo
		sleep 0.5
		touch $(DISPLAY_TRACKER)

$(UP_TRACKER)	: srcs/docker-compose.yml
		mkdir -p /home/$(LOGIN)/data/mariadb
		mkdir -p /home/$(LOGIN)/data/wordpress
		mkdir -p /home/$(LOGIN)/data/redis
		mkdir -p /home/$(LOGIN)/data/glances
		docker compose -f ./srcs/docker-compose.yml up -d
		touch $(UP_TRACKER);

up		: $(DISPLAY_TRACKER) $(UP_TRACKER)

down	:
		printf "\n $(GREEN)Containers down$(RESET) \n"
		docker compose -f ./srcs/docker-compose.yml down -v

clean	: down
		printf "\n $(GREEN)Delete home/$(LOGIN)/data$(RESET) \n"
		sudo rm -rf /home/$(LOGIN)/data
		rm -f $(DISPLAY_TRACKER)
		rm -f $(UP_TRACKER)

fclean	: clean
		printf "\n $(GREEN)Delete containers images$(RESET) \n"
		docker system prune -af --volumes

re		: fclean all

.PHONY	=	all down clean fclean re

ifndef VERBOSE
.SILENT:
endif