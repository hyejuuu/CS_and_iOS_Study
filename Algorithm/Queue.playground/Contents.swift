import Cocoa

class Node<Element> {
    var data: Element
    var next: Node<Element>?
    
    init(_ data: Element, next: Node<Element>? = nil) {
        self.data = data
        self.next = next
    }
}

struct Queue<Element> {
    var front: Node<Element>?
    var rear: Node<Element>?
    
    mutating func push(_ data: Element) {
        if front == nil {
            front = Node(data)
            rear = front
            return
        }
        
        let node = Node(data)
        rear?.next = node
        rear = node
    }
    
    mutating func pop() -> Element? {
        let node = front
        front = front?.next
        return node?.data
    }
    
    func show() {
        var currentNode = front
        
        while currentNode != nil {
            print(currentNode!.data, terminator: " ")
            currentNode = currentNode?.next
        }
    }
}

var queue = Queue<Int>()
queue.push(10)
queue.push(1)
queue.push(5)
queue.push(9)
queue.pop()
queue.show()
