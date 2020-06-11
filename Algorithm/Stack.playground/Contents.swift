import Cocoa

class Node<Element> {
    var data: Element
    var next: Node<Element>?
    
    init(_ data: Element, next: Node<Element>? = nil) {
        self.data = data
        self.next = next
    }
}

struct Stack<Element> {
    var top: Node<Element>?
    
    mutating func push(_ data: Element) {
        if top == nil {
            top = Node(data)
            return
        }
        
        let node = Node(data)
        node.next = top
        top = node
    }
    
    mutating func pop() -> Element? {
        if top == nil {
            return nil
        }
        
        top = top?.next
        
        return top?.data
    }
    
    func show() {
        var node = top
        
        while node != nil {
            print(node!.data, terminator: " ")
            node = node?.next
        }
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(3)
stack.push(9)
stack.push(22)
stack.pop()
stack.show()

