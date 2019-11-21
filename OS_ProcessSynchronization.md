## 데이터의 접근

컴퓨터 안에서 어떤 연산을 할 때는 항상 Data를 읽어와 연산을 하고 연산한 결과를 다시 어딘가에 저장하게 된다.

하지만 이런 Data를 한 곳이 아닌 여러 곳에서 가져가 연산을 하게 되면 문제가 생길 수 있다.



### Race Condition

<img width="725" alt="스크린샷 2019-11-12 오후 5 45 18" src="https://user-images.githubusercontent.com/34293225/68655933-3e6e9080-0574-11ea-8fdc-1ce5c69ddd4a.png">

의도한 결과:

count를 Execution 1에서 1을 더하고 결과를 Storage에 저장한다. 그 count값을 Execution 2에서 1을 빼 결과를 다시 Storage에 저장하면 count값은 그대로여야한다.

하지만 Execution 1에서 count값을 가져가고 결과를 Storage에 저장하지 않은 상태에서 Execution 2에서 count값을 가져간다. 이 후 Execution 1이 결과값을 Storage에 저장하고 Execution 2에서 연산 결과값을 Storage에 저장한다. 이러면 count가 의도했던 것과 다르게 1을 뺀 값만이 반영된다.

즉 하나의 고유데이터를 여럿이 동시에 접근하려고 할 때 생기는 위와 같은 문제를 **Race Condition(경쟁 상태)** 이라고 한다.

<br>

각 프로세스는 자신만의 주소 공간을 가지고 있기 때문에 문제가 발생하지 않는다.

아래와 같이 OS가 개입한 경우에 Race Condition이 발생하게 된다.

1. 프로세스 A가 시스템 콜로 운영체제에 있는 데이터를 반영하려고 하기 직전에 Context Switch로 CPU가 프로세스 B에게 넘어가고 프로세스 B의 시스템콜로 운영체제가 프로세스 A와 동일한 데이터를 변경했다면 다시 프로세스 A에게 CPU가 돌아왔을 때 하던 일을 마저할텐데 여기서 사용하는 데이터는 프로세스 B가 변경하기 전의 값을 사용하고 저장할 것이다.

   --> 커널 모드에서 CPU가 수행 중일 경우에는 preempt하지 않고, 다시 사용자 모드로 돌아갈 때 preempt한다.

2. 커널 모드에서 데이터 변경 중에 interrupt가 발생해 1번과 같은 일이 일어날 때

   --> 데이터 변경 중에는 interrupt를 disable 시켜 interrupt가 들어올 수 없도록 하고 작업이 끝나면 다시 interrupt를 enable 시킨다.

3. CPU가 여러개일 때 운영체제를 건들일 경우 여러 CPU가 모두 운영체제의 코드를 실행시킬 때 문제가 생긴다.

   하나의 CPU를 interrupt disable해도 다른 CPU가 데이터를 건들일 수가 있음

   1) 한번에 하나의 CPU만 커널모드로 들어갈 수 있게 하는 방법

   ​	--> 운영체제 전체를 독점해서 사용하는 것이기 때문에 오버헤드가 너무 크다.

   2)  커널 내부에 있는 각 공유 데이터에 접근할 때마다 그 데이터에 대해 lock / unlock을 하는 방법

   ​	--> 여러 CPU들이 운영체제를 사용중이여도 해당 데이터를 건들지 않으면 충분히 운영체제 코드를 동시에 수행할 수 있다.



<br>

## Process Synchronization 문제

- 공유 데이터(shared data)의 동시 접근은 데이터의 불일치(inconsistency)를 발생시킬 수 있다.
- 그렇기 때문에 협력 프로세스 간의 실행 순서를 정해주는 메커니즘이 필요하다.



### The Critical-Section Problem

Critical section이란 각 프로세스가 공유 데이터에 접근하는 코드 부분을 말한다.

<img width="635" alt="스크린샷 2019-11-21 오후 2 41 31" src="https://user-images.githubusercontent.com/34293225/69307128-12869580-0c6d-11ea-82f2-8b3f1cf43eaf.png">

X = X -1 과 같은 코드는 위와 같이 기계어로 바꿨을 때 여러 단계로 나누어지는데 이러한 명령을 실행하는 도중에 (데이터를 가져오는 명령만 실행했을 때) CPU가 같은 공유 데이터를 사용하는 프로세스에게 넘어가게 되면 문제가 발생할 수 있다.



#### 해결법

- 프로세스의 일반적인 구조

<img width="849" alt="스크린샷 2019-11-21 오후 2 41 38" src="https://user-images.githubusercontent.com/34293225/69307129-14505900-0c6d-11ea-8b05-ed2cd4808147.png">

critical section 앞 뒤로 어떤 코드를 추가해야 이 문제를 해결할 수 있을까?

- critical section 문제 해결법의 조건

  1. Mutual exclusion (상호 배제)

     프로세스 Pi가 critical section 부분을 수행중이면 다른 모든 프로세스들은 해당 critical section에 들어가면 안된다.

  2. Progress (진행)

     아무도 critical section을 수행중이지 않으면 critical section에 들어가고자 하는 프로세스가 들어갈 수 있어야한다.

  3. Bounded waiting (유한 대기)

     starvation을 막고자하는 것으로 프로세스가 critical section에 들어가려고 요청하면 그 요청이 허용될 때까지의 시간은 유한해야한다.



- Algorithm1 : 나의 turn을 확인하는 turn 사용

  <img width="844" alt="스크린샷 2019-11-21 오후 2 48 31" src="https://user-images.githubusercontent.com/34293225/69307453-064f0800-0c6e-11ea-9dbd-5dc5124a8baa.png">

  문제점

  --> 과잉양보 : 반드시 critical section에 한번씩 교대로 들어가야한다. 상대 프로세스가 critical section에 들어갔다가 나오면서 turn 값을 내 값으로 바꿔줘야만 내가 들어갈 수 있다. 만약 내가 critical section에 들어가야하는데 상대 프로세스가 critical section에 평생 들어가지 않는다면 나도 critical section에 평생 들어갈 수 없음

  

- Algorithm2 : 프로세스마다 flag를 사용

  <img width="844" alt="스크린샷 2019-11-21 오후 3 01 50" src="https://user-images.githubusercontent.com/34293225/69311538-de60a400-0c6f-11ea-9f77-69a0067c7208.png">

  문제점

  --> 만약 Pi가 flag[i] = true를 실행하고 Pj에게 CPU를 빼앗기면 Pi와 Pj의 flag가 모두 true가 되기 때문에 아무도 critical section에 들어가지 못하고 기다리는 경우가 발생한다.



- Algorithm3 (Peterson's Algorithm) : turn과 flag를 모두 사용

