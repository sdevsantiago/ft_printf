/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_putstr.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/14 21:25:18 by sede-san          #+#    #+#             */
/*   Updated: 2025/08/26 01:18:33 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include "ft_printf_int.h"

int	ft_printf_putstr(
	int fd,
	char const *str)
{
	int	len;

	len = 0;
	if (!str)
		len = ft_printf_putstr(fd, "(null)");
	while (str && *str)
	{
		len += ft_printf_putchar(fd, *str);
		str++;
	}
	return (len);
}
