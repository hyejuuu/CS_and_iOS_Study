### 연결 리스트

리스트란 데이터를 순차적으로 관리하기 위한 자료구조입니다.

리스트는 노드(Node)의 선형 연결로 이루어져 있으며, 노드는 데이터와 SinglyLinkedList에는 다음 노드를 가리키는 포인터(next)를, DoublyLiskedList는 다음 노드와 전 노드를 가리키는 포인터(prev, next)를 갖습니다.

또한 리스트의 시작 노드를 head라고 하며 마지막 노드는 tail이라고 합니다. 다음 노드가 없는 tail의 next값은 NULL로 설정합니다.



- SinglyLinkedList
<img width="531" alt="스크린샷 2020-06-13 오후 7 02 35" src="https://user-images.githubusercontent.com/34293225/84568237-f12bf900-adb8-11ea-8465-54da29f61640.png">


- DoublyLinkedList
<img width="643" alt="스크린샷 2020-06-13 오후 9 07 03" src="https://user-images.githubusercontent.com/34293225/84568353-d908a980-adb9-11ea-9d12-18fe573ad615.png">




우선 SinglyLinkedList에 대해서 설명하도록 하겠습니다 :) 

singlyLinkedList는 데이터와 next 포인터를 가진다고 했기 때문에 아래와 같이 Node를 정의해줍니다.

```swift
class Node<T> {
    var data: T
    var next: Node?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
```



또한 리스트는 앞과 뒤를 가리키는 head와 tail을 갖습니다.

```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
}
```



리스트에서 삽입과 삭제를 위한 메소드들은 아래와 같습니다.

맨앞에 데이터를 추가하기 위한 addFirst(data:) 메소드입니다.

<img width="719" alt="스크린샷 2020-06-13 오후 7 17 56" src="https://user-images.githubusercontent.com/34293225/84568267-220c2e00-adb9-11ea-960e-b8be2bb418d9.png">


```swift
mutating func addFirst(data: T) {
	let node = Node(data)
	node.next = head
  head = node
        
	if tail == nil {
    tail = head
  }
}
```





원하는 위치에 데이터를 추가하기 위한 insert(at:data:) 메소드입니다.

<img width="415" alt="스크린샷 2020-06-13 오후 7 28 09" src="https://user-images.githubusercontent.com/34293225/84568280-2fc1b380-adb9-11ea-88f7-849d2ab7795b.png">


```swift
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
```





마지막에 데이터를 추가하기 위한 append(data:) 메소드입니다.
<img width="591" alt="스크린샷 2020-06-13 오후 7 31 34" src="https://user-images.githubusercontent.com/34293225/84568288-4831ce00-adb9-11ea-98a6-787b679a41e7.png">

```swift
mutating func append(data: T) {
  guard head != nil else {
    addFirst(data: data)
    return
  }
        
  let node = Node(data)
  tail?.next = node
  tail = tail?.next
}
```





맨앞에 데이터를 삭제하기 위한 removeFirst() 메소드 입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 11 10" src="https://user-images.githubusercontent.com/34293225/84568434-706dfc80-adba-11ea-9f3d-6c608d6222ae.png">

```swift
mutating func removeFirst() {
    head = head?.next
}
```





원하는 위치의 데이터를 삭제하기 위한 remove(at:) 메소드 입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 11 02" src="https://user-images.githubusercontent.com/34293225/84568431-6e0ba280-adba-11ea-8daa-d29c7eb4d161.png">

```swift
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
```





마지막 데이터를 삭제하기 위한 removeLast() 메소드 입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 10 57" src="https://user-images.githubusercontent.com/34293225/84568430-6d730c00-adba-11ea-97b5-85d23f8cb3e1.png">

```swift
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
```



- DoublyLinkedList
SinglyLinkedList의 노드는 다음 노드만 가리키는 형태로 되어있지만 DoublyLinkedList의 노드는 이전 노드를 가리키는 prev를 포함합니다.

```swift
class Node<T> {
    var data: T
    var next: Node<T>?
    var prev: Node<T>?
    
    init(_ data: T, next: Node<T>? = nil, prev: Node<T>? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}
```



DoublyLinkedList의 삽입과 삭제를 위한 메소드들은 아래와 같습니다.

맨앞에 데이터를 추가하기 위한 addFirst(data:) 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 06 24" src="https://user-images.githubusercontent.com/34293225/84568393-2d138e00-adba-11ea-9521-9b9146a0e4ff.png">

```swift
mutating func addFirst(data: T) {
    let node = Node(data)
    node.next = head
    head?.prev = node
    head = node

    if tail == nil {
        tail = head
    }
}
```





원하는 위치에 데이터를 추가하기 위한 insert(at:data:) 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 06 16" src="https://user-images.githubusercontent.com/34293225/84568391-2be26100-adba-11ea-8ebd-b8cecdd556c0.png">

```swift
mutating func insert(at index: Int, data: T) {
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
```





마지막 위치에 데이터를 추가하기 위한 append(data:) 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 06 08" src="https://user-images.githubusercontent.com/34293225/84568389-2ab13400-adba-11ea-9016-6853be4dcd6f.png">

```swift
mutating func append(data: T) {
    if head == nil {
        addFirst(data: data)
        return
    }

    let node = Node(data)
    tail?.next = node
    node.prev = tail
    tail = node
}
```





맨앞의 데이터를 삭제하기 위한 removeFirst() 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 05 58" src="https://user-images.githubusercontent.com/34293225/84568380-179e6400-adba-11ea-863d-7bb2aa677184.png">

```swift
mutating func removeFirst() {
    if head == nil {
        return
    }

    head = head?.next
    head?.prev = nil
}

```





원하는 위치의 데이터를 삭제하기 위한 remove(at:) 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 05 50" src="https://user-images.githubusercontent.com/34293225/84568379-166d3700-adba-11ea-96cf-48c2d6dfada2.png">

```swift
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
```





마지막 위치의 데이터를 삭제하기 위한 removeLast() 메소드입니다.

<img width="643" alt="스크린샷 2020-06-13 오후 9 05 39" src="https://user-images.githubusercontent.com/34293225/84568378-14a37380-adba-11ea-8dd4-b09333dd8ce9.png">

```swift
mutating func removeLast() {
    if head == nil {
        return
    }

    tail = tail?.prev
    tail?.next = nil
}
```

