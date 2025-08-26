<div align="center">

  <!-- Project badge -->
  <a href=".">
    <img src="assets/README/ft_printfe.png">
  </a>

  <!-- Project name -->
  <h1>ft_printf</h1>

  <!-- Short description -->
  <p>A reimplementation of the <strong>printf</strong> function in C.</p>

  <!-- Info badges -->
  <img src="https://img.shields.io/badge/Score-100%2F100-brightgreen?style=for-the-badge&labelColor=black" alt="Score">
  <img src="https://img.shields.io/badge/Language-C-blue?style=for-the-badge&labelColor=black" alt="Language">
  <br>
  <img src="https://img.shields.io/github/last-commit/sdevsantiago/ft_printf?display_timestamp=committer&style=for-the-badge&labelColor=black" alt="Last commit">
  <br>
  <img src="https://github.com/sdevsantiago/ft_printf/actions/workflows/norminette.yml/badge.svg">
  <img src="https://github.com/sdevsantiago/ft_printf/actions/workflows/makefile.yml/badge.svg">
  
</div>

---

## ℹ️ About Project

> The purpose of this project is to recode C's original function printf().

This library reimplements the core functionality of the standard `printf()` and `fprintf()` functions. It also implements the `ft_eprintf()` function.

**Features:**
- **Full variadic argument support**: handles variable number of arguments using `va_list`
- **Comprehensive format specifiers**: supports all basic printf conversion specifiers
- **Error handling**: proper handling of malformed format strings

**Supported Format Specifiers:**
| Specifier | Type | Description |
|-----------|------|-------------|
| `%c` | Character | Prints a single character |
| `%s` | String | Prints a null-terminated string |
| `%d` | Integer | Prints a signed decimal integer |
| `%i` | Integer | Prints a signed decimal integer (same as %d) |
| `%u` | Unsigned Integer | Prints an unsigned decimal integer |
| `%o` | Octal | Prints an unsigned integer in octal base |
| `%x` | Hexadecimal | Prints an unsigned integer in lowercase hexadecimal |
| `%X` | Hexadecimal | Prints an unsigned integer in uppercase hexadecimal |
| `%p` | Pointer | Prints a pointer address in hexadecimal format |
| `%%` | Literal | Prints a literal '%' character |

### 🔧 Function Prototypes

```c
int ft_printf(char const *format, ...);
int ft_fprintf(int fd, char const *format, ...);
int ft_eprintf(char const *format, ...);
```

**Parameters:**
- `format`: Format string containing text and format specifiers
- `...`: Variable arguments corresponding to format specifiers
- `fd` (for `ft_fprintf`): File descriptor to which output is written

**Return value:**
- Number of characters printed on success
- `-1` on error (malformed format string)

For detailed info, refer to this project [subject](docs/en.subject.pdf).

## 🚀 Getting Started

### Prerequisites

- GCC compiler
- Make utility
- Unix-like system (Linux, macOS, WSL)

### Install prerequisites

- Debian/Ubuntu

  ```bash
  sudo apt install build-essential
  ```

## 🔧 Build

1. **Clone the repository:**
    ```bash
    git clone https://github.com/sdevsantiago/ft_printf.git
    cd ft_printf
    ```

2. **Compile the library:**
    ```bash
    make         # Full compilation
    make clean   # Remove object files
    make fclean  # Remove all generated files
    make re      # Rebuild everything from scratch
    ```

3. **Clean build files:**
    ```bash
    make clean  # Remove object files
    make fclean # Remove all generated files
    make re     # Rebuild everything from scratch
    ```

#### Available Make Targets

| Command | Description |
|---------|-------------|
| `make` | Compiles the ft_printf library (creates libftprintf.a) |
| `make all` | Same as `make` |
| `make clean` | Remove object files (*.o) |
| `make fclean` | Remove object files and the library |
| `make re` | Clean and rebuild everything |

## 👨‍💻 Usage

### Basic Usage

1. **Include the header in your C file:**
    ```c
    #include "ft_printf.h"
    ```

2. **Compile your program with the library:**
   ```bash
   cc -Wall -Wextra -Werror your_file.c path/to/ft_printf/libftprintf.a -I path/to/ft_printf/ -o your_program
   ```

### Example usage

```c
#include "ft_printf.h"
#include <fcntl.h>

int main(void)
{
    // Basic examples
    ft_printf("Hello, World!\n");
    ft_printf("Character: %c\n", 'A');
    ft_printf("String: %s\n", "42 School");
    ft_printf("Number: %d\n", 42);
    ft_printf("Unsigned: %u\n", 3000000000U);
    ft_printf("Hexadecimal: %x %X\n", 255, 255);
    ft_printf("Octal: %o\n", 64);
    ft_printf("Pointer: %p\n", &main);
    ft_printf("Percentage: %%\n");

    // Mixed format specifiers
    ft_printf("User %s has %d points and %u coins\n", "Alice", -50, 1500);

    // Hexadecimal formatting
    ft_printf("Memory address: %p, Value in hex: 0x%x\n", ptr, value);

    // Error handling
    int chars_printed = ft_printf("%", 42);
    if (chars_printed == -1)
    {
        // Handle error
    }

    int fd = open("file", O_WRONLY);
    if (fd != -1)
    {
        ft_fprintf(fd, "Hello %d\n", 42);
    }
    else
    {
        ft_eprintf("error: unable to write on file\n");
    }
    return (0);
}
```

## 📏 Norminette

The code strictly complies with 42's **Norminette v4**:

```bash
norminette *.c *.h
```

More info in the official [Norminette](https://github.com/42school/norminette) repository.

## 🙇‍♂️ Special thanks

- [lrcouto](https://github.com/lrcouto) and [ayogun](https://github.com/ayogun) for creating and publishing, respectively, the [42-project-badges](https://github.com/ayogun/42-project-badges) repository.
- [gcamerli](https://github.com/gcamerli) for creating the [42unlicense](https://github.com/gcamerli/42unlicense) repository.

## ⚖️ License

<div align="center">

<a href="./LICENSE">
<img src="https://img.shields.io/badge/License-42_Unlicense-red?style=for-the-badge&labelColor=black">
</a>

</div>

**This work is published under the terms of [42 Unlicense](LICENSE).** This means you are free to use, modify, and share this software.
