//
//  main.swift
//  l3_АлександрЖданов
//
//  Created by Alexandru Jdanov on 18.10.2021.
//

import Foundation

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

// 6. Вывести значения свойств экземпляров в консоль.

enum engine {
    case start
    case stop
}

enum window {
    case open
    case close
}

enum trunk {
    case volumeOne
    case volumeTwo
    case volumeThree
    case volumeFour
    case volumeFive
}


struct Car {
    let mark: String
    let year: Int
    let trunkVolume: Int
    var engine: engine {
        willSet {
            if newValue == .start {
            print("Двигатель автомобиля \(mark) запущен.")
            }
            else {
                print("Двигатель автомобиля \(mark) заглушен.")
            }
        }
    }
    var window: window {
        willSet {
            if newValue == .open {
                print("Окна автомобиля \(mark) открыты.")
            }
            else {
                print("Окна автомобиля \(mark) закрыты.")
            }
        }
    }
    var trunk: trunk {
        willSet {
            if newValue == .volumeOne {
                print("Объем багажника автомобиля \(mark) заполнен на 20 %.")
            }
            if newValue == .volumeTwo {
                print("Объем багажника автомобиля \(mark) заполнен на 40 %.")
            }
            if newValue == .volumeThree {
                print("Объем багажника автомобиля \(mark) заполнен на 60 %.")
            }
            if newValue == .volumeFour {
                print("Объем багажника автомобиля \(mark) заполнен на 80 %.")
            }
            if newValue == .volumeFive {
                print("Объем багажника автомобиля \(mark) заполнен на 100 %.")
            }
        }
    }
}

var sportCar = Car(mark: "Lamborghini", year: 2013, trunkVolume: 200, engine: .start, window: .open, trunk: .volumeOne)
var trunkCar = Car(mark: "MAN", year: 1998, trunkVolume: 1600, engine: .stop, window: .close, trunk: .volumeFour)

print("Автомобиль марки \(sportCar.mark) \(sportCar.year) года выпуска с объемом багажника \(sportCar.trunkVolume) Литров.")
sportCar.trunk = .volumeOne
sportCar.engine = .start
sportCar.window = .open

print("Автомобиль марки \(trunkCar.mark) \(trunkCar.year) года выпуска с объемом багажника \(trunkCar.trunkVolume) Литров.")
trunkCar.trunk = .volumeFour
trunkCar.engine = .stop
trunkCar.window = .close
