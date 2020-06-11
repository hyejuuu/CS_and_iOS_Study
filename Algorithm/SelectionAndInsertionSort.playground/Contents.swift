import Cocoa

func selectionSort(array: [Int]) {
    var array = array
    for i in 0..<array.count {
        var min = INTPTR_MAX
        var index = 0
        for j in i..<array.count {
            if min > array[j] {
                min = array[j]
                index = j
            }
        }
        array.swapAt(i, index)
    }
    
    print(array)
}

func insertionSort(array: [Int]) {
    var array = array
    
    for i in 0..<array.count {
        var index = i - 1
        while index >= 0, array[index] > array[index+1] {
            array.swapAt(index, index+1)
            index -= 1
        }
    }
    
    print(array)
}

var array: [Int] = []

array.append(10)
array.append(98)
array.append(1)
array.append(3)
array.append(2)
array.append(8)

selectionSort(array: array)
insertionSort(array: array)

