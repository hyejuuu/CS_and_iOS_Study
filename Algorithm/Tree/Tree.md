### 트리(Tree)

트리란 나무를 뒤집은 것과 같은 형태의 노드로 이루어진 자료구조입니다. 
<img width="643" alt="스크린샷 2020-06-16 오후 5 59 43" src="https://user-images.githubusercontent.com/34293225/84755932-27f25100-affd-11ea-9784-54caab9c4d9d.png">

<br/>
트리 자료구조에서 사용되는 용어들은 아래와 같습니다. 

- 노드(Node): 트리를 구성하는 요소로 데이터와 자식의 정보를 가지고 있습니다. 

- 엣지(edge): 노드들을 연결하는 선으로 부모 노드와 자식 노드를 연결하는 역할을 합니다.

- 루트 노드(root node): 부모를 가지지 않는 노드로 트리의 가장 상위에 존재합니다.

- 리프 노드(leaf node): 자식을 가지지 않는 노드로 트리의 가장 하위에 존재합니다.
<img width="643" alt="스크린샷 2020-06-16 오후 6 02 36" src="https://user-images.githubusercontent.com/34293225/84755945-29bc1480-affd-11ea-9bb1-18a10661c4a3.png">

- 부모 노드: 특정 노드의 바로 위에 있는 상위 노드를 의미합니다.

- 자식 노드: 특정 노드의 바로 아래에 있는 하위 노드를 의미합니다.

- 형제 노드: 같은 부모를 가지는 자식 노드들을 의미합니다.

<img width="643" alt="스크린샷 2020-06-16 오후 6 05 25" src="https://user-images.githubusercontent.com/34293225/84755948-2aed4180-affd-11ea-84fa-c6a344614ca0.png">


- 길이(length): 출발 노드에서 목적지 노드까지 거쳐야하는 엣지의 수를 의미합니다.
<img width="686" alt="스크린샷 2020-06-16 오후 6 08 11" src="https://user-images.githubusercontent.com/34293225/84756071-4bb59700-affd-11ea-862e-ba286e4c1c4f.png">


- 깊이(depth): 루트 노드에서 특정 노드까지의 길이를 의미합니다.
<img width="664" alt="스크린샷 2020-06-16 오후 6 06 47" src="https://user-images.githubusercontent.com/34293225/84756066-4a846a00-affd-11ea-9c83-636c0b46f9f9.png">

- 트리의 높이(height): 루트 노드에서 가장 깊은 노드까지의 길이를 의미합니다. (위의 이미지에서 트리의 높이는 2입니다.)

<br/><br/>


### 이진 트리(Binary Tree)

이진 트리란 자식 노드를 최대 2개만 가질 수 있는 트리입니다.

<img width="686" alt="스크린샷 2020-06-16 오후 6 16 30" src="https://user-images.githubusercontent.com/34293225/84756274-89b2bb00-affd-11ea-8b61-4f6ac8e38cea.png">

<br/>

**포화 이진 트리(Full binary tree)**

포화 이진 트리란 리프 노드를 제외한 모든 노드가 자식 노드를 2개씩 가지고 있는 트리를 말합니다.

<img width="752" alt="스크린샷 2020-06-16 오후 6 34 38" src="https://user-images.githubusercontent.com/34293225/84758299-3b52eb80-b000-11ea-8b78-5d0b5e700617.png">

<br/>

**완전 이진 트리(Complete binary tree)**

완전 이진 트리란 왼쪽 자식부터 순서대로 채워진 트리를 말합니다.

<img width="752" alt="스크린샷 2020-06-16 오후 6 34 47" src="https://user-images.githubusercontent.com/34293225/84758305-3d1caf00-b000-11ea-8920-1f52b0d3b16d.png">

<br/>

**높이 균형 트리(Height balanced tree)**

높이 균형 트리란 왼쪽 자식 트리와 오른쪽 자식 트리의 높이 차이가 1이상 나지 않는 트리를 말합니다. 오른쪽 트리는 한쪽으로 편향되었다고해서 편향 트리라고 합니다.

<img width="751" alt="스크린샷 2020-06-16 오후 6 35 05" src="https://user-images.githubusercontent.com/34293225/84758311-3e4ddc00-b000-11ea-909a-dfcbfeba7d92.png">



<br/><br/>

#### 이진 트리의 순회

이진 트리의 데이터를 하나씩 방문하는 방법에는 세가지가 있습니다. 

<img width="686" alt="스크린샷 2020-06-16 오후 6 16 30" src="https://user-images.githubusercontent.com/34293225/84756274-89b2bb00-affd-11ea-8b61-4f6ac8e38cea.png">

1. 전위 순회 (pre order)

   방문 순서 : root  -> left -> right

   30 -> 17 -> 5 -> 23 -> 48 -> 37 -> 50

   

2. 중위 순회 (in order)

   방문 순서 : left  -> root -> right

   5 -> 17 -> 23 -> 30 -> 37 -> 48 -> 50



3. 후위 순회 (post order)

   방문 순서 : left  -> right -> root

   5 -> 23 -> 17 -> 37 -> 50 -> 48 -> 30