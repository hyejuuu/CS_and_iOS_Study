import UIKit

let table_Size = 10007
let input_Size = 5000

struct Student {
    var id: Int?
    var name: String?
}

class Bucket {
    var data: Student
    var next: Bucket?
    
    init(data: Student, next: Bucket? = nil) {
        self.data = data
        self.next = next
    }
}

func initHashTable() {
    for index in 0..<table_Size {
        hashTable[index] = nil
    }
}

func isExist(id: Int) -> Bool {
    let index = id % table_Size
    if hashTable[index] == nil { return false }
    else {
        var current = hashTable[index]
        while current != nil {
            if current?.data.id == id { return true }
            current = current?.next
        }
    }
    return false
}

func add(input: Student) {
    let index = input.id! % table_Size
    if hashTable[index] == nil {
        hashTable[index] = Bucket(data: input)
    } else {
        // 앞부분에 노드를 추가
        let current = Bucket(data: input, next: hashTable[index])
        hashTable[index] = current
    }
}

func show() {
    for index in 0..<table_Size {
        if hashTable[index] != nil {
            var current = hashTable[index]
            while current != nil {
                print("키: \(index), 이름: \(current!.data.name)")
                current = current?.next
            }
        }
    }
}

var hashTable: [Bucket?] = Array(repeating: nil, count: table_Size)
initHashTable()

for _ in 0..<input_Size {
    var student = Student()
    student.id = Int.random(in: 0..<1000000)
    student.name = "\(student.id!)"
    if isExist(id: student.id!) == false {
        add(input: student)
    }
}

show()
