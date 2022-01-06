//
//  main.swift
//  l2_АлександрЖданов
//
//  Created by Alexandru Jdanov on 15.10.2021.

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

var randomNumbers = [2, 23, -14, 47, 8, 243]

for sortingNumber in randomNumbers {
     sortingNumber % 2 == 0 ? print("\(sortingNumber) чётное число") : print("\(sortingNumber) нечётное число")
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

var randomNumbersTwo = [43, 4, -6, 15, 72, 110]

for sortingNumberTwo in randomNumbersTwo {
     sortingNumberTwo % 3 == 0 ? print("\(sortingNumberTwo) делится на 3 без остатка") : print("\(sortingNumberTwo) не делится на 3 без остатка")
}

// 3. Создать возрастающий массив из 100 чисел.

var oneHundredNumbers = [Int]()

for nextNumber in 1...100 {
    oneHundredNumbers.append(nextNumber)
}
print(oneHundredNumbers)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for remuveNumbers in oneHundredNumbers {
     remuveNumbers % 2 == 0 || remuveNumbers % 3 == 0 ? () : print(remuveNumbers)
}

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacci(_ n: Int) -> [Int] {
    var fibonacciNumbers: [Int] = [0, 1]
    for summ in 2...n {
        fibonacciNumbers.append(fibonacciNumbers[summ - 1] + fibonacciNumbers[summ - 2])
    }
    return fibonacciNumbers
}

print(fibonacci(50))

// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

func integersNumbers(passedNumbers: [Int]) -> [Int] {

    var p = passedNumbers
    var wholeNumbers = [Int]()
    
    while let n = p.first {
        wholeNumbers.append(n)
        p = p.filter { $0 % n != 0 }
    }
    return wholeNumbers
    }

print(integersNumbers(passedNumbers: Array(2...100)))
