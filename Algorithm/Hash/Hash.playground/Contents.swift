import UIKit

let table_Size = 10007
let input_Size = 5000

struct Student {
    var id: Int?
    var name: String?
}

func initHashTable() {
    for index in 0..<table_Size {
        hashTable[index] = nil
    }
}

// 해시 테이블에 빈 공간을 선형으로 탐색
func findEmpty(id: Int) -> Int {
    var i = id % table_Size
    while true {
        if hashTable[i % table_Size] == nil {
            return i % table_Size
        }
        i += 1
    }
}

func search(id: Int) -> Int {
    var i = id % table_Size
    while true {
        if hashTable[i % table_Size] == nil {
            return -1
        } else if hashTable[i % table_Size]?.id == id {
            return i
        }
        i += 1
    }
}

func add(input: Student, key: Int) {
    hashTable[key] = input
}

func getValue(key: Int) -> Student {
    return hashTable[key] ?? Student()
}

func show() {
    for index in 0..<table_Size {
        if hashTable[index] != nil {
            print("키: \(index), 이름: \(hashTable[index]!.name!)")
        }
    }
}

var hashTable: [Student?] = Array(repeating: nil, count: table_Size)
initHashTable()

for _ in 0..<input_Size {
    var student = Student()
    student.id = Int.random(in: 0..<1000000)
    student.name = "\(student.id!)"
    if search(id: student.id!) == -1 {
        let index = findEmpty(id: student.id!)
        add(input: student, key: index)
    }
}

show()
