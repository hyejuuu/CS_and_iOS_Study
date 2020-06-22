## AVL Tree

AVL Tree는 균형이 이루어진 Binary Tree입니다.

Binary Search Tree는 편향 이진 트리가 발생할 가능성이 있고 그 경우에는 O(N)의 시간 복잡도를 가질 수 있습니다. 하지만 완전 이진 트리의 형태인 경우에는 O(log N)의 시간 복잡도를 유지할 수 있게 해주는데 특정 이진 트리를 완전 이진 트리에 가까운 형태를 유지해 탐색을 빠르게 해준 것이 바로 AVL Tree입니다.

AVL Tree는 균형 인수(Balance Factor)라는 개념을 사용합니다.

균형 인수 = 왼쪽 자식 높이 - 오른쪽 자식 높이

즉 균형 인수를 이용해서 모든 왼쪽 자식의 높이와 오른쪽 자식의 높이 차이가 -1, 0, +1를 유지시켜주는 로직이 추가된 트리를 의미합니다.

만약에 -1보다 작거나 +1보다 큰 경우에는 트리를 상황에 맞게 다시 회전(Rotation) 시켜줘야 합니다. 



### AVL Tree의 회전(Rotation)

AVL Tree는 총 4가지 형식에 의해서 균형이 깨질 수 있습니다. 

**LL 형식**

왼쪽 자식의 왼쪽에 삽입하는 경우

<img width="400" alt="스크린샷 2020-06-22 오후 5 22 59" src="https://user-images.githubusercontent.com/34293225/85265380-20bfbd00-b4ad-11ea-87cd-98a5ed82faa0.png">

LL 형식으로 노드가 추가되었을 경우에는 L의 rightChild를 X의 leftChild로, L의 rightChild를 X로 설정해 회전시켜줍니다.

<img width="654" alt="스크린샷 2020-06-22 오후 5 52 06" src="https://user-images.githubusercontent.com/34293225/85268203-2cad7e00-b4b1-11ea-837f-80c8e9a8862d.png">



**LR 형식**

왼쪽 자식의 오른쪽에 삽입하는 경우

<img width="400" alt="스크린샷 2020-06-22 오후 5 23 05" src="https://user-images.githubusercontent.com/34293225/85265382-21f0ea00-b4ad-11ea-85f0-0a25ca2560ba.png">

LR 형식으로 노드가 추가되었을 경우에는 우선 L을 기준으로 RR회전을 시켜줍니다. 이후에 LL 형식으로 만들어진 트리에 LL회전을 진행시켜줍니다.

<img width="785" alt="스크린샷 2020-06-22 오후 5 52 28" src="https://user-images.githubusercontent.com/34293225/85268214-30d99b80-b4b1-11ea-9426-40f84a19b41c.png">



**RR 형식**

오른쪽 자식의 오른쪽에 삽입하는 경우

<img width="400" alt="스크린샷 2020-06-22 오후 5 23 11" src="https://user-images.githubusercontent.com/34293225/85265385-23221700-b4ad-11ea-8701-d35ae078072f.png">

RR 형식으로 노드가 추가되었을 경우에는 R의 leftChild를 X의 rightChild로, R의 leftChild를 X로 설정해 회전시켜줍니다. (LL형식에서 rightChild<->leftChild로 바꿔준것과 같은 로직입니다:D)

<img width="654" alt="스크린샷 2020-06-22 오후 5 52 11" src="https://user-images.githubusercontent.com/34293225/85268206-2ddeab00-b4b1-11ea-9b9b-945cd2c6d097.png">

**RL 형식**

오른쪽 자식의 왼쪽에 삽입하는 경우

<img width="400" alt="스크린샷 2020-06-22 오후 5 23 15" src="https://user-images.githubusercontent.com/34293225/85265386-23baad80-b4ad-11ea-9d0b-ee2e6ea4f436.png">

RL 형식으로 노드가 추가되었을 경우에는 우선 R을 기준으로 LL회전을 시켜줍니다. 이후에 RR 형식으로 만들어진 트리에 RR회전을 진행시켜줍니다. (LR형식에서 rightChild<->leftChild로 바꿔준것과 같은 로직입니다:D)

<img width="785" alt="스크린샷 2020-06-22 오후 5 52 34" src="https://user-images.githubusercontent.com/34293225/85268221-32a35f00-b4b1-11ea-823a-c6845f6bf0d5.png">



AVL Tree의 균형 잡기는 노드를 삽입할 때 마다 진행되어야 합니다. 