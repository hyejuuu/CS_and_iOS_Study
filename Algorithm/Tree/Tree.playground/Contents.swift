import Cocoa

class Node<Element> {
    var data: Element
    var leftChild: Node<Element>?
    var rightChild: Node<Element>?
    
    init(_ data: Element,
         leftChild: Node<Element>? = nil,
         rightChild: Node<Element>? = nil) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func preorder<Element>(_ root: Node<Element>?) {
    guard let root = root else { return }
    print(root.data, terminator: " ")
    preorder(root.leftChild)
    preorder(root.rightChild)
}

func inorder<Element>(_ root: Node<Element>?) {
    guard let root = root else { return }
    inorder(root.leftChild)
    print(root.data, terminator: " ")
    inorder(root.rightChild)
}

func postorder<Element>(_ root: Node<Element>?) {
    guard let root = root else { return }
    postorder(root.leftChild)
    postorder(root.rightChild)
    print(root.data, terminator: " ")
}

let node7 = Node(50)
let node6 = Node(37)
let node5 = Node(23)
let node4 = Node(5)
let node3 = Node(48, leftChild: node6, rightChild: node7)
let node2 = Node(17, leftChild: node4, rightChild: node5)
let node1 = Node(30, leftChild: node2, rightChild: node3)

preorder(node1)
print("")
inorder(node1)
print("")
postorder(node1)
