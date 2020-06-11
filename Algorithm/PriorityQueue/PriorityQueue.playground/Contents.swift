import Cocoa

struct PriorityQueue {
    var heap: [Int] = []
    var count = 0
    
    mutating func push(data: Int) {
        guard count < 10000 else { return }
        heap.append(data)
        var current = count
        var parent = (count - 1) / 2
        
        while current > 0, heap[parent] < heap[current] {
            heap.swapAt(parent, current)
            current = parent
            parent = (parent - 1) / 2
        }
        
        count += 1
    }
    
    mutating func pop() -> Int {
        guard count > 0 else { return -9999 }
        let result = heap[0]
        count -= 1
        heap[0] = heap[count]
        var current = 0
        var leftChild = 1
        var rightChild = 2
        var target = current
        while leftChild < count {
            if heap[current] < heap[leftChild] {
                target = leftChild
            }
            if heap[leftChild] < heap[rightChild], rightChild < count {
                target = rightChild
            }
            if target == current { break }
            
            heap.swapAt(target, current)
            current = target
            leftChild = current * 2 + 1
            rightChild = current * 2 + 2
        }
        
        return result
    }
}

var priorityQueue = PriorityQueue()
priorityQueue.push(data: 9)
priorityQueue.push(data: 2)
priorityQueue.push(data: 0)
priorityQueue.push(data: 8)
priorityQueue.push(data: 4)
priorityQueue.push(data: 3)
priorityQueue.push(data: 5)
priorityQueue.push(data: 2)
priorityQueue.push(data: 3)
priorityQueue.push(data: 4)

for _ in 0..<priorityQueue.heap.count {
    print(priorityQueue.pop(), terminator: " ")
}

