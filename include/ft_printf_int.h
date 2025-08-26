/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_int.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/25 02:55:58 by sede-san          #+#    #+#             */
/*   Updated: 2025/08/26 01:17:30 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// This header is used by ft_printf internally, do not include

#ifndef FT_PRINTF_INT_H
# define FT_PRINTF_INT_H

# include "libft.h"
# include <stdint.h>

// ft_printf_putchar.c
int	ft_printf_putchar(int fd, int const c);

// ft_printf_putstr.c
int	ft_printf_putstr(int fd, char const *str);

// ft_printf_putint.c
int	ft_printf_putint(int fd, int const n);

// ft_printf_putuint.c
int	ft_printf_putuint(int fd, unsigned int const n);
int	ft_printf_putuint_oct(int fd, unsigned int const n);
int	ft_printf_putuint_hex(int fd, unsigned int const n, int const specifier);

// ft_printf_putptr.c
int	ft_printf_putptr(int fd, uintptr_t const ptr);

#endif /* FT_PRINTF_INT_H */
