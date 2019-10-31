#### 프로세스의 개념

프로세스는 실행중인 프로그램을 말합니다:)

<br>

#### 프로세스의 상태

- Running : CPU를 잡고 instruction을 수행중인 상태
- Ready : CPU를 기다리는 상태
  - 다른 준비는 끝나있고 CPU 사용권만 있으면 instruction을 실행할 수 있는 상태를 말한다.
- Blocked(wait, sleep) : CPU를 줘도 당장 instruction을 실행할 수 없는 상태
  - 프로세스가 요청한 작업이 있을 때 그 작업이 끝나지 않아서 작업이 완료될 때까지 기다리고 있는 상태

<img width="915" alt="프로세스의 상태(queue)" src="https://user-images.githubusercontent.com/34293225/67753563-3ee93080-fa78-11e9-9e6c-2e9cd8e9667e.png">
<br>

#### 프로세스 상태도

![프로세스 상태도](https://user-images.githubusercontent.com/34293225/67675135-c031bc00-f9c1-11e9-8d53-39931f8ace92.png)



<br>



#### PCB(Process Control Block)

각 프로세스를 관리하기 위해서 OS의 Data영역에 프로세스 정보들을 저장해놓은 것

저장되어있는 정보들

1. OS가 관리 상 사용하는 정보

   Process State (running, ready, blocked)

   Process ID

   Scheduling information

   Priority

2. CPU 수행 관련 하드웨어 값 -> 프로세스의 문맥(context)을 표시하기 위한 정보들

   Program counter

   Registers

3. 메모리 관련

   Code, Data, Stack의 위치 정보

4. 파일 관련 정보

 

<br>



#### 문맥교환(Context Switch)

CPU를 한 프로세스에서 다른 프로세스로 넘겨주는 과정을 말한다.

프로세스 A가 CPU를 사용하고 있다가 CPU 사용권을 빼앗기는 경우 지금까지 실행하던 문맥을 저장하지 않고있다가 다시 프로세스 A에게 CPU 사용권이 돌아왔을 때 프로그램 코드를 처음부터 실행해야 할 것이다. 이런 일을 방지하기 위해서 제대로된 문맥교환이 이루어져야한다.

그래서 CPU 사용권을 빼앗기는 시점의 하드웨어에 저장되어있던 PC, register 정보, memory map 등 정보들을 프로세스 A의 PCB에 복사해서 저장해두고 다시 CPU 사용권을 얻을 시점이 오면 해당 프로세스A의 PCB에 저장된 정보들을 하드웨어에 복원해주고 CPU를 넘겨준다.

![문맥교환](https://user-images.githubusercontent.com/34293225/67847408-29423c80-fb46-11e9-8c5d-45fdc524e90e.png)

위와 같이 CPU가 가지고 있던 프로세스가 다른 프로세스에게 넘어갈 경우를 문맥교환이 일어났다고 한다.

물론 1번째 경우에도 CPU를 프로세스에서 OS에게 넘겨줘야해서 문맥교환이 일어나야하지만 2의 경우가 훨씬 더 문맥교환으로 인한 오버헤드가 크기 때문에 2의 경우를 흔히 문맥교환이 일어났다고 한다.

<br>



####스케줄러

- Long-term scheduler(장기 스케줄러 or job scheduler)
  - 메모리를 어떤 프로세스에게 먼저 줄지 결정한다. 즉 어떤 프로세스를 new에서 ready(memory에 올라간 상태)로 바꾸어줄것인가를 결정한다.
  - Degree of Multiprogramming을 제어한다.  -> 메모리에 프로그램이 몇개나 올라가 있는가를 나타낸다.
  - Time sharing system에는 존재하지 않는다. (Time sharing system은 무조건 모든 프로세스를 ready상태로 만든다.)
- Medium-term scheduler(중기 스케줄러 or Swapper)
  - Time sharing system에는 장기 스케줄러 대신 swapper가 존재한다.
  - 모든 프로세스를 memory에 올려놓고 메모리에 너무 많은 프로그램이 올라가 있으면 사용하지 않는 일부 프로그램을 골라 통째로 메모리에서 내쫓는다. (프로세스에게서 memory를 뺏음)
  - Degree of Multiprogramming을 제어한다. 
- Short-term scheduler(단기 스케줄러 or **CPU Schduler**)
  - 굉장히 짧은 시간 단위로 스케줄이 이루어진다. (millisecond 단위)
  - 다음에 어떤 프로세스에게 CPU를 넘겨줄지 결정한다.

 <br>



#### 프로세스의 상태 (swapper가 있는 경우)

- Running
- Ready
- Blocked(wait, sleep) : 자신이 요청한 event가 만족되면 ready
- Suspended(stopped)
  - 외부적인 이유로 프로세스의 수행이 정지된 상태 (ex: 메모리에 너무 많은 프로세스가 올라와 있는 경우, 사용자가 프로그램을 일시정지 시킨 경우)
  - 프로세스는 통째로 디스크로 **swap out**된다.
  - suspended된 프로세스는 외부에서 정지시킨 상태이기 때문에 외부에서 resume해주어야 다시 active될 수 있다.







