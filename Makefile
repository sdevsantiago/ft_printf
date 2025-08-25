# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/29 19:07:42 by sede-san          #+#    #+#              #
#    Updated: 2025/08/26 00:27:39 by sede-san         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ******************************* Output files ******************************* #

# Project name
NAME = libftprintf.a

# ************************** Compilation variables *************************** #

# Compiler
CC = cc

# Compilation flags
CFLAGS = -Wall -Wextra -Werror -Wunreachable-code # -Ofast

# Additional headers
HEADERS = -I $(INCLUDE_PATH) -I $(LIBFT_INCLUDE_PATH)

# Debug flags, execute with DEBUG=1 -> make DEBUG=1
DFLAGS = -g3
ifeq ($(DEBUG), 1)
	CFLAGS += $(DFLAGS)
endif

# Make command with no-print-directory flag
MAKE += --no-print-directory

# ***************************** Style variables ****************************** #

# Define color codes
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RESET = \033[0m # No Color

# Emojis
EMOJI_BROOM = 🧹
EMOJI_CHECK = ✅
EMOJI_CROSS = ❌
EMOJI_WRENCH = 🔧
EMOJI_BOX = 📦

# ****************************** Source files ******************************** #

# Source files path
SRC_PATH = src

# Source files
SRC = \
	$(SRC_PATH)/ft_printf.c									\
	$(SRC_PATH)/character_string_types/ft_printf_putchar.c	\
	$(SRC_PATH)/character_string_types/ft_printf_putstr.c	\
	$(SRC_PATH)/integer_types/ft_printf_putint.c			\
	$(SRC_PATH)/integer_types/ft_printf_putuint.c			\
	$(SRC_PATH)/memdir_types/ft_printf_putptr.c

# Include path
INCLUDE_PATH = ./include

# ****************************** Object files ******************************** #

# Object files path
OBJS_PATH = build

# Source files and destination paths
OBJS = $(SRC:$(SRC_PATH)/%.c=$(OBJS_PATH)/%.o)

# Compile as object files
$(OBJS_PATH)/%.o: $(SRC_PATH)/%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@ $(HEADERS)
	@echo "$< compiled"

# ********************************* Rules ************************************ #

# Compile all
all: libft $(NAME)
.PHONY: all

# Compile project
$(NAME): $(OBJS)
	@echo "$(YELLOW)$(EMOJI_BOX) Linking...$(RESET)"
	@cp $(LIBFT_BIN) $(NAME)
	ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)$(EMOJI_CHECK) Linked.$(RESET)"

# Clean object files
clean:
	@echo "$(RED)$(EMOJI_BROOM) Cleaning object files...$(RESET)"
	@rm -rf $(OBJS_PATH)
	@echo "$(GREEN)$(EMOJI_CHECK) Object files cleaned.$(RESET)"
.PHONY: clean

# Clean object files and binaries
fclean: clean
	@echo "$(RED)$(EMOJI_BROOM) Cleaning binaries...$(RESET)"
	@rm -f $(NAME)
	@if [ -d $(LIBFT_PATH) ]; then \
		$(MAKE) -C $(LIBFT_PATH) fclean; \
	fi
	@echo "$(GREEN)$(EMOJI_CHECK) Binaries cleaned.$(RESET)"
.PHONY: fclean

# Recompile
re: fclean all
.PHONY: re

# ********************************* Libraries ******************************** #

# Compile libraries
lib:
	@$(MAKE) libft
.PHONY: lib

# Compile file with libraries
LIBS = $(LIBFT_BIN)

# Libraries path
LIB_PATH = lib

# ** Libft ** #

LIBFT = Libft
LIBFT_REPO = https://github.com/sdevsantiago/Libft.git
LIBFT_PATH = $(LIB_PATH)/$(LIBFT)
LIBFT_INCLUDE_PATH = $(LIBFT_PATH)
LIBFT_BIN = $(LIBFT_PATH)/libft.a

libft: $(LIBFT_BIN)

$(LIBFT_BIN):
	@if [ ! -d $(LIBFT_PATH) ]; then \
		echo "$(YELLOW)$(EMOJI_WRENCH) Cloning $(LIBFT)...$(RESET)"; \
		git clone $(LIBFT_REPO) $(LIBFT_PATH); \
		rm -rf $(LIBFT_PATH)/.git; \
		echo "$(GREEN)$(EMOJI_CHECK) $(LIBFT) cloned...$(RESET)"; \
	fi
	@if [ ! -f $(LIBFT_BIN) ]; then \
		echo "$(YELLOW)$(EMOJI_WRENCH) Compiling $(LIBFT)...$(RESET)"; \
		$(MAKE) -C $(LIBFT_PATH) all clean; \
		echo "$(GREEN)$(EMOJI_CHECK) $(LIBFT) compiled.$(RESET)"; \
	else \
		echo "$(GREEN)$(EMOJI_CHECK) $(LIBFT) already compiled.$(RESET)"; \
	fi
.PHONY: libft
