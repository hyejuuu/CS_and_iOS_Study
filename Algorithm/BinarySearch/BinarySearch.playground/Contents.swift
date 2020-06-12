import Cocoa

var array = [10, 39, 29, 22, 90, 1, 8, 98]

array.sort()

func binarySearch(data: Int, start: Int, end: Int) -> Int {
    guard start <= end else { return -9999 }
    let mid = (start + end) / 2
    if array[mid] == data { return mid }
    else if data < array[mid] {
        return binarySearch(data: data, start: start, end: mid - 1)
    } else {
        return binarySearch(data: data, start: mid + 1, end: end)
    }
}

let result = binarySearch(data: 8, start: 0, end: array.count - 1)
if result == -9999 {
    print("원소를 찾을 수 없습니다.")
} else {
    print("\(result+1)번째 원소입니다.")
}
