/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_putstr.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/14 21:25:18 by sede-san          #+#    #+#             */
/*   Updated: 2025/08/25 03:03:56 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include "ft_printf_int.h"

int	ft_printf_putstr(char const *str)
{
	int	len;

	len = 0;
	if (!str)
		len = ft_printf_putstr("(null)");
	while (str && *str)
	{
		len += ft_printf_putchar(*str);
		str++;
	}
	return (len);
}
