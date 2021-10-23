//
//  main.swift
//  l4_александЖданов
//
//  Created by Alexandru Jdanov on 22.10.2021.
//

import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль

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

class Car {
    var mark: String
    var year: Int
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
    
    init(mark: String, year: Int, trunkVolume: Trunk) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        
    }
}

class TrunkCar: Car {
    var luggage: Trailer
    init(mark: String, year: Int, trunkVolume: Trunk, luggage: Trailer) {
        self.luggage = luggage
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    func treilerPresence() {
        luggage == .isPrezent ? (print("Прицеп присутсвует")) : print("Прицеп отсутвует")
    }
}

class SportCar: Car {
    var fastMode: SportMode
    init(mark: String, year: Int, trunkVolume: Trunk, fastMode: SportMode) {
        self.fastMode = fastMode
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    func speedOption() {
        fastMode == .On ? (print("Спорт режим включен")) : print("Спорт режим выключен")
    }
}

let volvo = TrunkCar(mark: "Volvo", year: 2014, trunkVolume: .volumeFive, luggage: .isPrezent)
let mazerati = SportCar(mark: "Mazerati", year: 2020, trunkVolume: .volumeOne, fastMode: .Off)

volvo.trunkVolume = .volumeFive
volvo.treilerPresence()
mazerati.trunkVolume = .volumeOne
mazerati.speedOption()










