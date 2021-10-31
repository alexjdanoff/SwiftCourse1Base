
import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct WorkTime {
    public var day: String
    public var hours: Int
}

extension WorkTime: CustomStringConvertible {
    public var description: String {
        return "День недели \(day), отработанные часы \(hours)"
    }
}

struct Queue<T> {
    private var elements = [T]()
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue() -> T {
        return elements.removeLast()
    }
    
    func printMyQueue() {
        print(elements)
    }
    
    subscript(index: Int) -> T? {
        if index > elements.count || index < 0 {
            return nil
        }
        else {
            return elements[index]
        }
    }
}

extension Queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var rezult = [T]()
        for index in elements {
            if predicate(index) {
                rezult.append(index)
            }
        }
        return rezult
    }
}

private var workWeek = Queue<WorkTime>()
workWeek.enqueue(element: .init(day: "Понедельник", hours: 8))
workWeek.enqueue(element: .init(day: "Вторник", hours: 10))
workWeek.enqueue(element: .init(day: "Среда", hours: 4))
workWeek.enqueue(element: .init(day: "Четверг", hours: 12))
workWeek.enqueue(element: .init(day: "Пятница", hours: 24))
workWeek.enqueue(element: .init(day: "Суббота", hours: 3))
workWeek.enqueue(element: .init(day: "Воскресенье", hours: 0))

workWeek.printMyQueue()

private let fullWorkDay = workWeek.myFilter(predicate: { $0.hours >= 8 })
print("Полные рабочие дни = \(fullWorkDay)")
