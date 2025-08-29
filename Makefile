# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/29 19:07:42 by sede-san          #+#    #+#              #
#    Updated: 2025/08/29 16:58:10 by sede-san         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ******************************* Output files ******************************* #

NAME = libftprintf.a

# ************************** Compilation variables *************************** #

CC		= cc
CFLAGS	= -Wall -Wextra -Werror -Wunreachable-code
HEADERS	= -I $(INCLUDE_PATH) -I $(LIBFT_INCLUDE_PATH)

ifeq ($(DEBUG), 1)
	CFLAGS += -g3
endif

MAKE += --no-print-directory

# ****************************** Source files ******************************** #

SRC_PATH = src

SRC =														\
	$(SRC_PATH)/ft_printf.c									\
	$(SRC_PATH)/character_string_types/ft_printf_putchar.c	\
	$(SRC_PATH)/character_string_types/ft_printf_putstr.c	\
	$(SRC_PATH)/integer_types/ft_printf_putint.c			\
	$(SRC_PATH)/integer_types/ft_printf_putuint.c			\
	$(SRC_PATH)/memdir_types/ft_printf_putptr.c

INCLUDE_PATH = include

# ****************************** Object files ******************************** #

OBJS_PATH = build

OBJS = $(SRC:$(SRC_PATH)/%.c=$(OBJS_PATH)/%.o)

$(OBJS_PATH)/%.o: $(SRC_PATH)/%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@ $(HEADERS)
	@echo "$< compiled"

# ********************************* Rules ************************************ #

all: libft $(NAME)
.PHONY: all

$(NAME): $(OBJS)
	@echo "$(YELLOW)$(EMOJI_BOX) Linking...$(RESET)"
	@cp $(LIBFT_BIN) $(NAME)
	ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)$(EMOJI_CHECK) Linked.$(RESET)"

clean:
	@echo "$(RED)$(EMOJI_BROOM) Cleaning object files...$(RESET)"
	@rm -rf $(OBJS_PATH)
	@echo "$(GREEN)$(EMOJI_CHECK) Object files cleaned.$(RESET)"
.PHONY: clean

fclean: clean
	@echo "$(RED)$(EMOJI_BROOM) Cleaning binaries...$(RESET)"
	@rm -f $(NAME)
	@if [ -d $(LIBFT_PATH) ]; then					\
		$(MAKE) --silent -C $(LIBFT_PATH) fclean;	\
	fi
	@echo "$(GREEN)$(EMOJI_CHECK) Binaries cleaned.$(RESET)"
.PHONY: fclean

re: fclean all
.PHONY: re

# ********************************* Libraries ******************************** #

LIB_PATH = lib

# ** Libft ** #

LIBFT = Libft
LIBFT_REPO = https://github.com/sdevsantiago/Libft.git
ifndef LIBFT_PATH
	LIBFT_PATH = $(LIB_PATH)/$(LIBFT)
endif
LIBFT_INCLUDE_PATH = $(LIBFT_PATH)
LIBFT_BIN = $(LIBFT_PATH)/libft.a

libft: $(LIBFT_BIN)
.PHONY: libft

$(LIBFT_BIN):
	@if [ ! -d $(LIBFT_PATH) ]; then \
		echo "$(YELLOW)$(EMOJI_WRENCH) Cloning $(LIBFT)...$(RESET)";	\
		git clone --quiet $(LIBFT_REPO) $(LIBFT_PATH);					\
		rm -rf $(LIBFT_PATH)/.git;										\
		echo "$(GREEN)$(EMOJI_CHECK) $(LIBFT) cloned...$(RESET)";		\
	fi
	@if [ ! -f $(LIBFT_BIN) ]; then \
		echo "$(YELLOW)$(EMOJI_WRENCH) Compiling $(LIBFT)...$(RESET)";	\
		$(MAKE) --silent -C $(LIBFT_PATH) all clean;					\
		echo "$(GREEN)$(EMOJI_CHECK) $(LIBFT) compiled.$(RESET)";		\
	fi

# ***************************** Style variables ****************************** #

RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RESET = \033[0m

EMOJI_BROOM = 🧹
EMOJI_CHECK = ✅
EMOJI_CROSS = ❌
EMOJI_WRENCH = 🔧
EMOJI_BOX = 📦
