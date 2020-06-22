import UIKit

class Node: Equatable {
    var data: Int
    var height: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(_ data: Int,
         _ height: Int = 1,
         leftChild: Node? = nil,
         rightChild: Node? = nil) {
        self.data = data
        self.height = height
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data
    }
}

func getHeight(node: Node?) -> Int {
    if node == nil { return 0 }
    return node!.height
}

func setHeight(node: Node?) {
    node?.height
        = max(node?.leftChild?.height ?? 0,
              node?.rightChild?.height ?? 0) + 1
}

func getBalanceFactor(node: Node?) -> Int {
    if node == nil { return 0 }
    return getHeight(node: node?.leftChild)
        - getHeight(node: node?.rightChild)
}

func rotateLL(node: Node) -> Node {
    let leftChild = node.leftChild
    node.leftChild = leftChild?.rightChild
    leftChild?.rightChild = node
    setHeight(node: node)
    return leftChild!
}

func rotateLR(node: Node) -> Node {
    let leftChild = node.leftChild
    node.leftChild = rotateRR(node: leftChild!)
    setHeight(node: node.leftChild)
    return rotateLL(node: node)
}

func rotateRR(node: Node) -> Node {
    let rightChild = node.rightChild
    node.rightChild = rightChild?.leftChild
    rightChild?.leftChild = node
    setHeight(node: node)
    return rightChild!
}

func rotateRL(node: Node) -> Node {
    let rightChild = node.rightChild
    node.rightChild = rotateLL(node: rightChild!)
    setHeight(node: node.rightChild)
    return rotateRR(node: node)
}

func balance(node: Node) -> Node {
    var node = node
    let balanceFactor = getBalanceFactor(node: node)
    
    if balanceFactor >= 2 {
        if getBalanceFactor(node: node.leftChild) >= 1 {
            node = rotateLL(node: node)
        } else {
            node = rotateLR(node: node)
        }
    } else if balanceFactor <= -2 {
        if getBalanceFactor(node: node.leftChild) <= -1 {
            node = rotateRR(node: node)
        } else {
            node = rotateRL(node: node)
        }
    }
    setHeight(node: node)
    return node
}

func insertNode(node: Node?, data: Int) -> Node {
    var node = node
    
    if node == nil {
        node = Node(data)
    } else if data < node!.data {
        node?.leftChild = insertNode(node: node?.leftChild, data: data)
        node = balance(node: node!)
    } else if data > node!.data {
        node?.rightChild = insertNode(node: node?.rightChild, data: data)
        node = balance(node: node!)
    } else {
        print("데이터 중복 발생")
    }
    
    return node!
}

var root: Node?

func display(node: Node?, level: Int) {
    if node != nil {
        display(node: node?.rightChild, level: level + 1)
        print("")
        if node == root {
            print("Root: ", terminator: "")
        }
        
        var i = 0
        while node != root, i < level {
            print("     ", terminator: "")
            i += 1
        }
        print("\(node!.data), \(node!.height)", terminator: "")
        display(node: node?.leftChild, level: level + 1)
    }
}


root = insertNode(node: root, data: 30)
root = insertNode(node: root, data: 17)
root = insertNode(node: root, data: 48)
root = insertNode(node: root, data: 5)
root = insertNode(node: root, data: 23)
root = insertNode(node: root, data: 37)
root = insertNode(node: root, data: 50)
root = insertNode(node: root, data: 1)
root = insertNode(node: root, data: 6)
root = insertNode(node: root, data: 7)
root = insertNode(node: root, data: 22)
root = insertNode(node: root, data: 11)
root = insertNode(node: root, data: 19)
display(node: root, level: 1)
