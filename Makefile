# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjacobi <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/07 11:02:51 by jjacobi           #+#    #+#              #
#    Updated: 2016/11/21 16:53:25 by jjacobi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= fillit

CC			= gcc
FLAGS		= -Wall -Wextra -Werror

SRC_FILES	= main.c stock_tetri.c fillit.c
OBJ			= $(SRC_FILES:.c=.o)

H_DIR		= ./includes
LIBFT_PATH	= ./libft
SRC_FOLDER	= ./srcs

GREEN		= \033[32m
RED			= \033[31m
DEFAULT		= \033[37m

all: $(NAME)

$(NAME): $(OBJ) libft.a
	@$(CC) $(FLAGS) -o $@ $(OBJ) $(LIBFT_PATH)/libft.a -I $(H_DIR)
	@echo -e "$(GREEN)$(NAME)$(DEFAULT) created."

libft.a:
	@echo -e "$(DEFAULT)"
	@(cd $(LIBFT_PATH) && $(MAKE))

%.o: $(SRC_FOLDER)/%.c
	@$(CC) $(FLAGS) -c -o $@ $< -I $(H_DIR)
	@echo -e "$(GREEN). \c"

clean:
	@rm -rf $(OBJ)
	@(cd $(LIBFT_PATH) && $(MAKE) $@)
	@echo -e "$(RED).o $(DEFAULT) are now deleted for $(NAME)."

fclean:
	@rm -rf $(NAME) $(OBJ)
	@(cd $(LIBFT_PATH) && $(MAKE) $@)
	@echo -e "$(RED).o $(DEFAULT) are now deleted for $(NAME)."
	@echo -e "$(RED)$(NAME)$(DEFAULT) deleted."

re: fclean all

.PHONY: clean fclean re all
