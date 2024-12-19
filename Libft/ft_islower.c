/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_islower.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/14 19:43:25 by sede-san          #+#    #+#             */
/*   Updated: 2024/11/14 19:44:34 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/* Checks if the passed character is lowercase.  */
int	ft_islower(int c)
{
	return (c >= 'a' && c <= 'z');
}