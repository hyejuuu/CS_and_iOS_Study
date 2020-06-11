import Cocoa

class Node<Element> {
    var data: Element
    var next: Node<Element>?
    var prev: Node<Element>?
    
    init(_ data: Element, next: Node<Element>? = nil, prev: Node<Element>? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

struct DoubleLinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    mutating func addFirst(data: Element) {
        let node = Node(data)
        node.next = head
        head?.prev = node
        head = node
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(data: Element) {
        if head == nil {
            addFirst(data: data)
            return
        }
        
        let node = Node(data)
        tail?.next = node
        node.prev = tail
        tail = node
    }
    
    mutating func insert(at index: Int, data: Element) {
        if head == nil {
            addFirst(data: data)
            return
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while let next = currentNode?.next, currentIndex < index {
            currentNode = next
            currentIndex += 1
        }
        
        let node = Node(data)
        node.next = currentNode
        node.prev = currentNode?.prev
        currentNode?.prev?.next = node
        currentNode?.prev = node
    }
    
    mutating func removeFirst() {
        if head == nil {
            return
        }
        
        head = head?.next
        head?.prev = nil
    }
    
    mutating func removeLast() {
        if head == nil {
            return
        }
        
        tail = tail?.prev
        tail?.next = nil
    }
    
    mutating func remove(at index: Int) {
        if head == nil {
            return
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while let next = currentNode?.next, currentIndex < index {
            currentNode = next
            currentIndex += 1
        }
        
        currentNode?.prev?.next = currentNode?.next
        currentNode?.next?.prev = currentNode?.prev
    }
    
    func showList() {
        var node = head
        
        while node != nil {
            print("\(node!.data)", terminator: " ")
            node = node?.next
        }
    }
}

var linkedList = DoubleLinkedList<Int>()
linkedList.addFirst(data: 1)
linkedList.addFirst(data: 3)
linkedList.append(data: 5)
linkedList.insert(at: 1, data: 10)
linkedList.insert(at: 3, data: 11)
linkedList.removeFirst()
linkedList.removeLast()
linkedList.remove(at: 1)
linkedList.showList()
