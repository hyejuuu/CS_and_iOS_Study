import Cocoa

class Node<T> {
    var data: T
    var next: Node?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func addFirst(data: T) {
        let node = Node(data)
        node.next = head
        head = node
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(data: T) {
        guard head != nil else {
            addFirst(data: data)
            return
        }
        
        let node = Node(data)
        tail?.next = node
        tail = tail?.next
    }
    
    mutating func insert(at index: Int, data: T) {
        if head == nil {
            addFirst(data: data)
            return
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil, currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        let node = Node(data, next: currentNode?.next)
        currentNode?.next = node
    }
    
    mutating func removeFirst() {
        head = head?.next
    }
    
    mutating func removeLast() {
        if head == nil {
            return
        }
        
        var currentNode = head
        var prevNode = head
        
        while let next = currentNode?.next {
            prevNode = currentNode
            currentNode = next
        }
        
        prevNode?.next = nil
        tail = prevNode
    }
    
    mutating func remove(at index: Int) {
        if head == nil {
            return
        }
        
        var currentNode = head
        var prevNode = head
        var currentIndex = 0
        
        while let next = currentNode?.next, currentIndex < index {
            prevNode = currentNode
            currentNode = next
            currentIndex += 1
        }
        
        prevNode?.next = currentNode?.next
    }
    
    func showList() {
        var node = head
        
        while node != nil {
            print("\(node!.data)", terminator: " ")
            node = node?.next
        }
    }
    
}

var linkedList = LinkedList<Int>()
linkedList.addFirst(data: 1)
linkedList.addFirst(data: 3)
linkedList.addFirst(data: 5)
linkedList.addFirst(data: 2)
linkedList.append(data: 9)
linkedList.insert(at: 2, data: 10)
linkedList.removeFirst()
linkedList.removeLast()
linkedList.remove(at: 1)
linkedList.showList()
