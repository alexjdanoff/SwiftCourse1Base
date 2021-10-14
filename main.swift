

import Foundation

// 1. Решить квадратное уравнение.
// ax² - bx - c = 0

let a: Double = 1
let b: Double = -4
let c: Double = -5
var d: Double = (pow(b, 2)) - 4 * a * c
var x1: Double = (-b + (sqrt(d))) / (2 * a)
var x2: Double = (-b - sqrt(d)) / (2 * a)
if d > 0 {
print("x1 =", x1, "x2 =", x2)
}


// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let q: Double = 4
let w: Double = 7
var s: Double = (q * w) / 2
print("Площадь треугольника равна", s)
var z: Double = sqrt(q * q + w * w)
print("Гипотенуза треугольника равна", z)
var p: Double = q + w + z
print("Периметр треугольника равна", p)


// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let Summ: Int = 4000 // Сумма вклада
let Precent: Int = 12 // Годовой процент
let Years: Int = 5 // Количество лет
var FinalSumm: Int = (Precent * Summ) / 100
print("Размер вклада через 5 лет составит", FinalSumm * Years)
