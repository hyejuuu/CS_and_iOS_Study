import UIKit

class Node {
    var data: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(data: Int, leftChild: Node? = nil, rightChild: Node? = nil) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func insertNode(root: Node?, data: Int) -> Node {
    var root = root
    
    if root == nil {
        root = Node(data: data)
    } else {
        if root!.data > data {
            root?.leftChild = insertNode(root: root?.leftChild, data: data)
        } else {
            root?.rightChild = insertNode(root: root?.rightChild, data: data)
        }
    }
    
    return root!
}

func searchNode(root: Node?, data: Int) -> Node? {
    if root == nil { return nil }
    if root!.data == data {
        return root
    } else if root!.data < data {
        return searchNode(root: root?.rightChild, data: data)
    } else {
        return searchNode(root: root?.leftChild, data: data)
    }
}

func findMinNode(root: Node?) -> Node? {
    var node = root
    while node?.leftChild != nil {
        node = node?.leftChild
    }
    return node
}

func removeNode(root: Node?, data: Int) -> Node? {
    if root == nil { return nil }
    if root!.data == data {
        if root?.leftChild != nil, root?.rightChild != nil {
            let node = findMinNode(root: root?.rightChild)
            if let node = node {
                root?.data = node.data
                removeNode(root: root?.rightChild, data: node.data)
            }
        } else {
            let node = root?.leftChild != nil ? root?.leftChild : root?.rightChild
            return node
        }
    } else if root!.data < data {
        root?.rightChild = removeNode(root: root?.rightChild, data: data)
    } else {
        root?.leftChild = removeNode(root: root?.leftChild, data: data)
    }
    return root
}

func preorder(root: Node?) {
    if root == nil { return }
    print(root!.data)
    preorder(root: root?.leftChild)
    preorder(root: root?.rightChild)
}

var root: Node?
root = insertNode(root: root, data: 30)
root = insertNode(root: root, data: 17)
root = insertNode(root: root, data: 48)
root = insertNode(root: root, data: 5)
root = insertNode(root: root, data: 23)
root = insertNode(root: root, data: 37)
root = insertNode(root: root, data: 50)
root = removeNode(root: root, data: 30)
preorder(root: root)
