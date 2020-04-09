import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//


struct List{
    var name: String
    var surname: String
    var mark: Int
}

extension List: CustomStringConvertible{
    var description: String{
        return "Имя: \(name), Фамилия: \(surname), Оценка: \(mark)"
    }
}


struct queue <T> {
    var elements: [T] = []
    var isEmpty: Bool {
        return elements.count == 0
    }
    mutating func inqueue(element: T){
        elements.append(element)
    }
mutating func outqueue()->T {
    return elements.removeLast()
    }
    
    var top: T? {
        if isEmpty {
            print("Ничего нет")
            return nil
        } else {
            print("Последний элемент \(elements.last!)")
            return elements.last
        }
    }
    var bottom: T? {
        if isEmpty {
            print("Ничего нет")
            return nil
        } else {
            print("Первый элемент \(elements.first!)")
            return elements.last
        }
    }
    func printMyQueue() {
        print(elements)
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var person = queue<List>()
person.inqueue(element: .init(name: "Анна", surname: "Рукова" , mark: 5))
person.inqueue(element: .init(name: "Марк", surname: "Иванов", mark: 2))
person.inqueue(element: .init(name: "Лена", surname: "Вагина", mark: 4))
person.inqueue(element: .init(name: "Стас", surname: "Михайлов", mark: 5))
person.inqueue(element: .init(name: "Анна", surname: "Семенович", mark: 3))


person.top
person.bottom
print(person)
person.printMyQueue()

var bestPerson = person.myFilter(predicate: {$0.mark == 5})
var badPerson = person.myFilter(predicate: {$0.mark == 2})
var allAnna = person.myFilter(predicate: {$0.name == "Анна"})
print("Лучшие: \(bestPerson)")
print("Худшие: \(badPerson)")
print("Все Анны: \(allAnna)")









