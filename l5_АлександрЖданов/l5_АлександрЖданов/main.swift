//
//  main.swift
//  l5_АлександрЖданов
//
//  Created by Alexandru Jdanov on 26.10.2021.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

//6. Вывести сами объекты в консоль.

enum Trailer {
    case isPrezent
    case isAbsent
}

enum SportMode {
    case On
    case Off
}

enum Trunk {
    case volumeOne
    case volumeTwo
    case volumeThree
    case volumeFour
    case volumeFive
}

enum Window {
    case open
    case close
}

enum Engine {
    case start
    case stop
}

protocol Car {
    var mark: String { get }
    var year: Int { get }
    var trunkVolume: Trunk { get set }
    var windowPosition: Window { get set }
    var engineCondition: Engine { get set }
}

extension Car {
    mutating func chooseWindowPosition(windowPosition: Window) {
        self.windowPosition = windowPosition
    }
    mutating func chooseEngineContition(engineCondition: Engine) {
        self.engineCondition = engineCondition
    }
    mutating func chooseTrunkVolume(trunkVolume: Trunk) {
        self.trunkVolume = trunkVolume
    }
}

class MainCar: Car {
    
    var mark: String
    var year: Int
    var windowPosition: Window {
        willSet {
            windowPosition == .open ? print("Окна открыты.") : print("Окна закрыты.")
        }
    }
    var engineCondition: Engine {
        willSet {
            engineCondition == .start ? print("Двигатель запущен.") : print("Двигатель заглушен.")
        }
    }
    var trunkVolume: Trunk {
            willSet {
                switch newValue {
                case .volumeOne: print("Объем багажника автомобиля \(mark) заполнен на 20 %.")
                case .volumeTwo: print("Объем багажника автомобиля \(mark) заполнен на 40 %.")
                case .volumeThree: print("Объем багажника автомобиля \(mark) заполнен на 60 %.")
                case .volumeFour: print("Объем багажника автомобиля \(mark) заполнен на 80 %.")
                case .volumeFive: print("Объем багажника автомобиля \(mark) заполнен на 100 %.")
                }
            }
        }
    init(mark: String, year: Int, trunkVolume: Trunk, windowPosition: Window, engineCondition: Engine) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.windowPosition = windowPosition
        self.engineCondition = engineCondition
    }
}

class TrunkCar: MainCar, CustomStringConvertible {
    var luggage: Trailer = .isPrezent
    var description: String {
        return "Автомобиль марки \(mark) \(year) года выпуска. Прицеп присутсвует."
    }
}

class SportCar: MainCar, CustomStringConvertible {
    var fastMode: SportMode = .On
    var description: String {
        return "Автомобиль марки \(mark) \(year) года выпуска. Спорт режим включен."
    }
}

var volvo = TrunkCar(mark: "Volvo", year: 2011, trunkVolume: .volumeFive, windowPosition: .close, engineCondition: .stop)
var mazerati = SportCar(mark: "Mazerati", year: 2020, trunkVolume: .volumeOne, windowPosition: .open, engineCondition: .start)

print(volvo.description)
volvo.trunkVolume = .volumeFive
volvo.windowPosition = .close
volvo.engineCondition = .stop

print(mazerati.description)
mazerati.trunkVolume = .volumeOne
mazerati.windowPosition = .open
mazerati.engineCondition = .start


