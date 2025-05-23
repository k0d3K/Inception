#==================== PARAM =====================#

LOGIN 			=	lguerbig
DISPLAY_TRACKER	:=	.display_done

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
		echo "  ______                                        __ "
		echo " /\\__  _\\                                      /\\ \\__    __ "
		echo " \\/_/\\ \\/      ___      ___      __    _____   \\ \\ ,_\\  /\\_\\     ___     ___ "
		echo "    \\ \\ \\    /' _ \`\\   /'___\\  /'__\`\\ /\\ '__\`\\  \\ \\ \\/  \\/\\ \\   / __\`\\ /' _ \`\\ "
		echo "     \\_\\ \\__ /\\ \\/\\ \\ /\\ \\__/ /\\  __/ \\ \\ \\L\\ \\  \\ \\ \\_  \\ \\ \\ /\\ \\L\\ \\/\\ \\/\\ \\ "
		echo "     /\\_____\\\\\ \\_\\ \\_\\\\\ \\____\\\\\\ \\____\\ \\ \\ ,__/   \\ \\__\\  \\ \\_\\\\\ \\____/\\ \\_\\ \\_\\ "
		echo "     \\/_____/ \\/_/\\/_/ \\/____/ \\/____/  \\ \\ \\/     \\/__/   \\/_/ \\/___/  \\/_/\\/_/ "
		echo "                                         \\ \\_\\ "
		echo "                                          \\/_/"
		echo
		sleep 0.5
		touch $(DISPLAY_TRACKER)

up		: $(DISPLAY_TRACKER)
		mkdir -p /home/$(LOGIN)/data/mariadb
		mkdir -p /home/$(LOGIN)/data/wordpress
		docker compose -f ./srcs/docker-compose.yml up -d

down	:
		printf "\n $(GREEN)Down containers$(RESET) \n\n"
		docker compose -f ./srcs/docker-compose.yml down

clean	: down
		printf "\n $(GREEN)Delete home/$(LOGIN)/data$(RESET) \n\n"
		sudo rm -rf /home/$(LOGIN)/data
		rm -f $(DISPLAY_TRACKER)

fclean	: clean
		printf "\n $(GREEN)Delete containers images$(RESET) \n\n"
		docker system prune -af

re		: fclean all

.PHONY	=	all up down clean fclean re

ifndef VERBOSE
.SILENT:
endif