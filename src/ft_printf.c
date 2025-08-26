/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/22 17:23:51 by sede-san          #+#    #+#             */
/*   Updated: 2025/08/26 02:03:06 by sede-san         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include "ft_printf_int.h"

static int	print_specifier(int fd, int const specifier, va_list args);

/* Formats a text and writes it in the standard output.  */
int	ft_printf(
	char const *format,
	...)
{
	int		len;
	va_list	args;

	va_start(args, format);
	len = 0;
	while (*format)
	{
		if (*format == '%')
		{
			format++;
			if (!*format)
				return (-1);
			len += print_specifier(STDOUT_FILENO, *format, args);
		}
		else
			len += ft_printf_putchar(STDOUT_FILENO, *format);
		format++;
	}
	va_end(args);
	return (len);
}

/* Formats a text and writes it in fd.  */
int	ft_fprintf(
	int fd,
	char const *format,
	...)
{
	va_list	args;
	int		len;

	if (fd < 0)
		return (-1);
	va_start(args, format);
	len = 0;
	while (*format)
	{
		if (*format == '%')
		{
			format++;
			if (!*format)
				return (-1);
			len += print_specifier(fd, *format, args);
		}
		else
			len += ft_printf_putchar(fd, *format);
		format++;
	}
	va_end(args);
	return (len);
}

/* Formats a text and writes it in the standard error.  */
int	ft_eprintf(
	char const *format,
	...)
{
	int		len;
	va_list	args;

	va_start(args, format);
	len = 0;
	while (*format)
	{
		if (*format == '%')
		{
			format++;
			if (!*format)
				return (-1);
			len += print_specifier(STDERR_FILENO, *format, args);
		}
		else
			len += ft_printf_putchar(STDERR_FILENO, *format);
		format++;
	}
	va_end(args);
	return (len);
}

static int	print_specifier(
	int fd,
	int const specifier,
	va_list args)
{
	int	len;

	if (specifier == 'c')
		len = ft_printf_putchar(fd, va_arg(args, int));
	else if (specifier == 's')
		len = ft_printf_putstr(fd, va_arg(args, char *));
	else if (specifier == 'd' || specifier == 'i')
		len = ft_printf_putint(fd, va_arg(args, int));
	else if (specifier == 'u')
		len = ft_printf_putuint(fd, va_arg(args, unsigned int));
	else if (specifier == 'p')
		len = ft_printf_putptr(fd, va_arg(args, uintptr_t));
	else if (specifier == 'o')
		len = ft_printf_putuint_oct(fd, va_arg(args, unsigned int));
	else if (specifier == 'x' || specifier == 'X')
		len = ft_printf_putuint_hex(fd, va_arg(args, unsigned int), specifier);
	else if (specifier == '%')
		len = ft_printf_putchar(fd, '%');
	else
	{
		len = ft_printf_putchar(fd, '%');
		len += ft_printf_putchar(fd, specifier);
	}
	return (len);
}
