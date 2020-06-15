import UIKit

var array = [5, 4, 3, 8, 9, 6, 7, 1, 10, 2]

func quickSort(start: Int, end: Int) {
    if start >= end { return }
    let pivot = start
    var left = pivot + 1
    var right = end
    while left <= right {
        while left <= end, array[left] < array[pivot] {
            left += 1
        }
        while right > start, array[right] > array[pivot] {
            right -= 1
        }
        if left < right {
            array.swapAt(left, right)
        } else {
            array.swapAt(pivot, right)
        }
    }
    quickSort(start: start, end: right - 1)
    quickSort(start: right + 1, end: end)
}

quickSort(start: 0, end: array.count - 1)
print(array)
