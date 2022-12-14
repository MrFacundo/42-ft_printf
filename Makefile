# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ftroiter <ftroiter@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/08 22:52:34 by ftroiter          #+#    #+#              #
#    Updated: 2022/12/27 13:59:31 by ftroiter         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= libftprintf.a

SRCS			= ft_printf ft_printf_functions ft_printf_utils
					
OBJS			= $(SRCS:=.o)

LIBFT_OBJS	= libft/*.o

CC				= gcc
RM				= rm -f
CFLAGS			= -Wall -Wextra -Werror

all:			$(NAME)

$(NAME):		$(OBJS) libft
				ar rcs $@ $(OBJS) $(LIBFT_OBJS)

%.o: %.c
				$(CC) -c $(CFLAGS) $?


libft:
				make -C libft

clean:
				$(RM) $(OBJS)
				make -C libft clean

fclean:			clean
					$(RM) $(NAME) libft/libft.a

re:					fclean $(NAME)

.PHONY:			all libft clean fclean re