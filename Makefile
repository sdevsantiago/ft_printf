# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/29 19:07:42 by sede-san          #+#    #+#              #
#    Updated: 2025/04/21 23:28:06 by sede-san         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ******************************* Output files ******************************* #
# Library name
NAME = ft_printf.a

# ************************** Compilation variables *************************** #
# Compiler
CC = cc

# Compilation flags
CFLAGS = -Wall -Wextra -Werror

# ****************************** Source files ******************************** #
SRC = \
ft_printf.c

CHARACTER_STRING_PATH = character_string_types

SRC += \
$(CHARACTER_STRING_PATH)/ft_printf_putchar.c \
$(CHARACTER_STRING_PATH)/ft_printf_putstr.c

INTEGER_PATH = integer_types

SRC += \
$(INTEGER_PATH)/ft_printf_putint.c	\
$(INTEGER_PATH)/ft_printf_putuint.c

MEMDIR_PATH = memdir_types

SRC += \
$(MEMDIR_PATH)/ft_printf_putptr.c

# ****************************** Object files ******************************** #
OBJ = $(SRC:.c=.o)

# Compile object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# ********************************* Rules ************************************ #
# Compile all
all: $(NAME)

$(NAME): libft $(OBJ)
	cp $(LIBFT) $(NAME)
	ar rcs $(NAME) $(OBJ)
	mv $(NAME) libftprintf.a

# Clean object files
clean:
	$(MAKE) -C $(LIBFT_PATH) clean
	rm -f $(OBJ)

# Clean object files and library
fclean: clean
	rm -rf $(LIB_PATH)
	rm -f $(OBJ)

# Recompile
re: fclean all

# ****************************** Libraries ********************************** #

LIB_PATH = lib

LIBFT_PATH = $(LIB_PATH)/Libft

LIBFT = $(LIBFT_PATH)/libft.a

libft:
	if [ ! -d $(LIBFT_PATH) ]; then \
		git clone git@github.com:sdevsantiago/Libft.git $(LIBFT_PATH); \
		$(MAKE) -C $(LIBFT_PATH) all bonus; \
	elif [ ! -x $(LIBFT) ]; then \
		$(MAKE) -C $(LIBFT_PATH) re bonus; \
	else \
		cd $(LIBFT_PATH); \
		git pull; \
		cd -; \
	fi

# *********************************** Phony ********************************** #
.PHONY = all clean fclean re
