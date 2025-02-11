### 운영체제의 목적

- 자원을 효율적으로 관리하기 위함
- 사용자에게 컴퓨터를 편리하게 사용할 수 있는 환경을 제공하기 위함



### 운영체제의 분류

- 동시 작업 가능 여부
  - Single Tasking : 한번에 하나의 작업만 처리함 (ex: DOS)
  - Multi Tasking : 동시에 두가지 이상의 작업을 처리함 (ex: UINX, Windows)
  <br>
- 사용자의 수
  - Single User : 한명의 사용자만 하나의 컴퓨터에 접근할 수 있음
  - Multi User : 여러 사용자가 하나의 컴퓨터에 동시에 접근할 수 있음
  <br>
- 처리 방식
  - 일괄처리 : 작업을 모아서 한꺼번에 처리하는 방식
  - 시분할(time sharing) : 여러 작업이 따로 실행되지만 운영체제가 작은 시간 단위로 나누어서 실행하기 때문에 마치 동시에 실행되는 것처럼 보이게 처리하는 방식
    -  interactive한 방식 (ex: 사용자가 키보드 입력을 했을 때 바로 화면에 결과를 볼 수 있다.)
    - 짧은 응답시간을 갖는다.
  - 실시간(realtime) : 데드라인이 존재해 정해진 시간 안에 반드시 결과가 나오도록 처리하는 방식으로 특별한 목적을 가진 시스템에서 사용한다.
    - Hard Realtime System : 반드시 데드라인을 지켜야하며 그렇지 못할 경우 엄청난 손실이 생기는 시스템
    - Soft Realtime System : 데드라인을 지키지 못하면 엄청난 손실이 생기는 것까진 아님

<br>

아래 네가지 용어는 모두 컴퓨터에서 여러 작업을 동시에 수행하는 것을 나타낸다.

- Multi tasking
- Multi programming : 여러 프로그램이 메모리에 올라가 있음을 말하며 Multi tasking에서 메모리를 강조한 용어
- Time sharing : CPU의 시간을 분할해 나누어 쓰는 것을 말하며 Multi tasking에서 CPU를 강조한 용어
- *Multi processor : 하나의 컴퓨터에 CPU가 여러개 존재하는 것을 말하는 용어로 위 세가지와 동일한 의미지만 하드웨어적으로는 다른 시스템이다.

<br>

### 운영체제의 구조

<img width="994" alt="운영체제구조" src="https://user-images.githubusercontent.com/34293225/67615803-a5b5e200-f80b-11e9-9c91-d53ed0690705.png">

- Mode Bit : 사용자 프로그램의 잘못된 수행으로 다른 프로그램 및 OS에 피해가 가지 않도록하기 위해 사용하는 Bit
  - 사용자모드 (1) : 사용자 프로그램이 CPU를 사용하고 있을 때로 제한된 명령만 실행이 가능한 상태
  - 커널모드 (0) : OS가 CPU를 사용하고 있을 때로 모든 명령이 실행가능한 상태
  <br>
- Timer : 특정 프로그램이 CPU를 독점하는 것을 막기위해서 존재
  - 타이머 값이 0이 되면 interrupt를 발생시켜 해당 프로그램에서 CPU 사용권을 빼앗는다.
  <br>
- Device Controller : I/O Device를 관리하는 일종의 작은 CPU -> hardware
- Device Driver : OS 코드에 포함되어있는 각 장치별 처리 루틴 -> software
<br>

- DMA(direct memory access) Controller : 너무 자주 interrupt가 발생하면 CPU가 매번 처리하던 일을 멈추고 device buffer에 저장된 것을 memory에 옮겨 저장해야하는 데 이러한 overhead가 너무 크기때문에 DMA Controller가 CPU 대신 interrupt가 발생하면 device buffer에 있는 것을 memory에 저장하는 역할을 함
  - interrupt를 모두 처리하면 CPU에게 처리함을 알린다
  <br>
- 시스템콜 : 사용자 프로그램이 운영체제의 커널함수를 호출하는 것으로 자신이 직접 interrupt를 발생시키 것.
  - 사용자 프로그램은 한정된 코드만 수행할 수 있기 때문에 필요한 IO작업같은 것들을 OS에게 대신해달라고 부탁해야하기 때문
  <br>
- Interrupt : CPU가 프로그램을 실행하고 있을 때, IO 장치의 작업완료 또는 예외상황이 발생하여 처리가 필요할 경우에 CPU에게 알려 처리할 수 있도록 하는 것
  - 인터럽트 시점의 레지스터와 PC를 저장하고 CPU의 사용권을 인터럽트 처리 루틴에게 넘긴다
  - Interrupt(하드웨어 인터럽트)
  - trap(소프트웨어 인터럽트)
    - Exception : 프로그램이 오류를 범한 경우 (ex: 사용자 프로그램이 OS영역에 접근하려한 경우, 0으로 나누는 연산을 시도한 경우 등)
    - System call : 프로그램이 커널 함수를 호출하는 경우


<br>

- 동기식 입출력 (synchronous I/O) : I/O 요청 후 작업이 완료된 후에야 제어가 사용자 프로그램에게 넘어감
- 비동기식 입출력 (asynchronous I/O) : I/O 요청 후 작업이 끝날 때까지 기다리지 않고 제어를 바로 사용자 프로그램에게 넘겨버림


<br>

### 프로그램의 실행 (메모리 load)

![프로그램의 실행](https://user-images.githubusercontent.com/34293225/67674370-a8f1cf00-f9bf-11e9-9877-cf1004d78c2e.png)


<br>

### 커널 주소 공간의 내용

![커널 주소 공간의 내용](https://user-images.githubusercontent.com/34293225/67691372-d0f22a00-f9e1-11e9-8dc4-f489909129c8.png)


<br>

**함수**

- 사용자 정의 함수
- 라이브러리 함수 : 자신의 프로그램에서 정의하지 않고 가져다 쓴 함수

--> 프로세스 address space의 code영역에 존재

- 커널 함수 : 운영체제 프로그램 함수 (커널 함수 호출 = 시스템콜)

--> 커널 address space의 code영역에 존재

<br>



