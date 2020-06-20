### 그래프

그래프란 정점(vertex)와 간선(edge)로 이루어진 자료구조입니다.

여기서 정점이란 독립된 개체로 동그라미로 표현하고, 간선은 두 정점을 잇는 개체로 선이나 화살표가 있는 선으로 표현합니다.

<img width="264" alt="스크린샷 2020-06-18 오후 11 05 40" src="https://user-images.githubusercontent.com/34293225/85030955-0d64d700-b1b9-11ea-93cd-2d9bf9d854df.png">

<br/>



####그래프와 관련된 용어

**인접하다(Adjacency)**

(A,B)라는 간선이 존재한다면, 정점 A와 정점 B는 서로 인접한다라고 합니다. 무방향성 그래프에서 인접관계는 서로 동일하지만 방향성 그래프에서는 그렇지 않습니다.

<img width="670" alt="스크린샷 2020-06-18 오후 11 11 10" src="https://user-images.githubusercontent.com/34293225/85030979-15bd1200-b1b9-11ea-85fa-9f60d7dd026f.png">

<br/>

**차수(Degree)**

정점의 진출차수(out-degree)란 정점에서 나가는 간선의 수입니다.

정점의 진입차수(in-degree)란 정점으로 들어오는 간선의 수입니다.

차수는 진출차수와 진입차수를 합한 것입니다.

<img width="300" alt="스크린샷 2020-06-18 오후 11 21 44" src="https://user-images.githubusercontent.com/34293225/85032199-81ec4580-b1ba-11ea-8b7a-48c7cf587adc.png">

<br/>

**경로(Path)**

정점 A부터 정점 B까지 가는데 지나치는 정점의 순서

경로의 길이: 경로에 있는 간선의 수

단순 경로(simple path) : 경로에 있는 모든 정점들이 서로 다른 경우를 말합니다.

<img width="489" alt="스크린샷 2020-06-18 오후 11 26 31" src="https://user-images.githubusercontent.com/34293225/85032788-32f2e000-b1bb-11ea-9a68-3d8936c1de5d.png">

<br/>

**순환(Cycle)과 단일 순환(Simple Cycle)**

순환이란 경로에서 출발점과 도착점이 같은 경우를 말합니다. 

단일 순환은 출발점과 도착점이 같은 경로에 있는 정점들이 서로 다른 경우를 말합니다.

ex) 경로 <1, 2, 4, 5, 4, 1>는 출발점과 도착점이 같은 cycle이지만 같은 정점이 존재하므로 simple cycle은 아닙니다.

​	  경로 <1, 2, 4, 1>은 출발점과 도착점이 같으면서 모든 정점들이 다르기 때문에 simple cycle입니다.



<br/><br/>

####그래프의 종류

**무방향 그래프(undirected graph)**

무방향성 간선을 가지는 그래프 입니다. 간선에 방향이 없기 때문에 양방향으로 이동이 가능하며, 직선을 사용해서 표현합니다. 정점 A와 정점 B를 연결하는 간선을 (A,B) 또는 (B,A)와 같이 표현하고 (A,B)와 (B,A)는 같은 간선입니다.

**방향 그래프(directed graph)**

방향성이 있는 간선으로 이루어진 그래프입니다. 방향을 가지기 때문에 화살표가 있는 선으로 사용합니다.  A -> B는 (A,B)로 표현하며 (A,B)는 B -> A인 (B,A)와는 다른 간선입니다.

<img width="582" alt="스크린샷 2020-06-18 오후 11 06 52" src="https://user-images.githubusercontent.com/34293225/85030975-135ab800-b1b9-11ea-8754-e69a6d329174.png">

**가중치 그래프(weighted graph)**

간선에 가중치가 할당된 그래프로 네트워크(network)라고도 합니다.

<img width="672" alt="스크린샷 2020-06-19 오전 1 42 48" src="https://user-images.githubusercontent.com/34293225/85048367-32177980-b1ce-11ea-81ad-2d35e4faeb34.png">

**연결 그래프(connected graph)**

정점이 모두 연결되어있어서 정점의 모든 쌍이 경로를 가지는 무방향 그래프를 말합니다.

반대로 무방향 그래프에서 특정 정점쌍 사이에 경로가 존재하지 않는 그래프를 비연결 그래프(Disconnected graph)라고 합니다.

-> 연결 요소 (Connected components) : 무방향 그래프에서 정점들이 최대한 연결되어 있는 하위 그래프

<img width="611" alt="스크린샷 2020-06-19 오전 1 48 06" src="https://user-images.githubusercontent.com/34293225/85048909-f204c680-b1ce-11ea-8f00-8605fd8c31cf.png">

**완전 그래프(complete graph)**

무방향 그래프에서 모든 정점의 쌍이 모두 인접하는 그래프입니다.

정점 수가 n이면 간선의 수는 n * (n-1) / 2

<img width="686" alt="스크린샷 2020-06-19 오전 1 49 47" src="https://user-images.githubusercontent.com/34293225/85049057-2d9f9080-b1cf-11ea-8f4a-2d16106ffac1.png">

**Forest**

순환(cycle)을 가지지 않는 무방향 그래프입니다.



**Tree**

Forest가 연결되어 있는 경우로 연결된 비순환 무방향 그래프입니다. (connected, acyclic, undirected graph)

<img width="600" alt="스크린샷 2020-06-19 오전 1 59 31" src="https://user-images.githubusercontent.com/34293225/85050086-8885b780-b1d0-11ea-854e-f268748c5ac8.png">



<br/>

<br/>

#### 그래프의 구현방법

**1. 인접 행렬 (Adjacency Matrix)**

인접 행렬이란 그래프를 아래와 같이 2차원 배열을 이용해 표현한 방식입니다.

만약 가중치 그래프라면 1 대신에 해당 정점 사이의 가중치를 저장하면 됩니다.

<img width="637" alt="스크린샷 2020-06-20 오후 4 50 07" src="https://user-images.githubusercontent.com/34293225/85196620-5f6f3f00-b316-11ea-8fd8-52979d3d1b1f.png">

인접 행렬은 모든 정점들의 연결 여부를 저장하기 때문에 O(V^2)의 공간을 요구합니다. 그래서 공간 효율성이 떨어지지만 두 정점이 서로 연결되어있는지 확인하기 위해서는 O(1)의 시간을 요구합니다.

<br/>



**2. 인접 리스트 (Adjacency List)**

인접 리스트란 그래프를 아래와 같이 리스트를 이용해서 표현한 방식입니다.

<img width="637" alt="스크린샷 2020-06-20 오후 5 01 33" src="https://user-images.githubusercontent.com/34293225/85196810-b6c1df00-b317-11ea-802b-a0669cb81be7.png">

인접 리스트를 사용하면 연결된 간선의 정보만 저장해 O(E)의 공간을 요구하기 때문에 공간 효율성이 우수합니다. 하지만 두 정점이 서로 연결되어있는지를 확인하기 위해서는 O(V)의 시간을 요구합니다.