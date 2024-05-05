#include <iostream>

// Функция для вычисления числа Фибоначчи
int fibonacci(int n) {
    if (n <= 1)
        return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Использование: " << argv[0] << " <число>" << std::endl;
        return 1;
    }

    int num = std::stoi(argv[1]);

    // Проверка на валидность введенного числа
    if (num < 0) {
        std::cerr << "Число должно быть неотрицательным." << std::endl;
        return 1;
    }

    // Вычисление и вывод числа Фибоначчи
    std::cout << "Число Фибоначчи для " << num << " = " << fibonacci(num) << std::endl;

    return 0;
}