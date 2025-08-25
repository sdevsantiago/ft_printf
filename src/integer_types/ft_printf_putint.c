/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_putint.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/14 21:20:32 by sede-san          #+#    #+#             */
/*   Updated: 2025/08/25 03:03:18 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include "ft_printf_int.h"

int	ft_printf_putint(int const n)
{
	int		len;
	char	*nb;

	nb = ft_itoa(n);
	if (!nb)
		return (0);
	len = ft_printf_putstr(nb);
	free(nb);
	return (len);
}
