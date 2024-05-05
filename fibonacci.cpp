#include <iostream>

// Функция для вычисления числа Фибоначчи
int fibonacci(int n) {
    if (n <= 1)
        return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Use: " << argv[0] << " <int>" << std::endl;
        return 1;
    }

    int num = std::stoi(argv[1]);

    // Проверка на валидность введенного числа
    if (num < 0) {
        std::cerr << "Not allowed" << std::endl;
        return 1;
    }

    // Вычисление и вывод числа Фибоначчи
    std::cout << "Result " << num << " = " << fibonacci(num) << std::endl;

    return 0;
}