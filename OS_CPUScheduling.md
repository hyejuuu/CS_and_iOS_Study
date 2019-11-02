- CPU Scheduler : Ready 상태의 프로세스 중에서 이번에 CPU 사용권을 줄 프로세스를 선택한다.
- Dispatcher : CPU 사용권을 CPU scheduler에 의해 선택된 프로세스에게 넘긴다. --> 이러한 과정이 Context switch이다.

<br>

- CPU 스케줄링이 필요한 경우

  1. Running -> Blocked (I/O 등 오래 걸리는 작업을 하러간 경우)

  2. Running -> Ready (Timer Interrupt)

  3. Blocked -> Ready (I/O 완료 후 인터럽트) --> priority가 가장 높다면 바로 Running 상태가 될 수도 있음

  4. Terminate

  - 1, 4번의 경우 자진해서 CPU를 반납하는 non-preemptive(비선점형)
  - 2, 3번의 경우 CPU를 강제로 뺏어버리는 preemptive(선점형)

<br>

### CPU Scheduling 성능 척도

- 시스템 입장에서의 성능 척도

  - CPU Utilization (이용률)

    - 전체 시간 중에서 CPU가 놀지 않고 일한 시간의 비율

      --> CPU는 가능한 바쁘게 유지시켜야 한다.

  - Throughput (처리량)

    - 주어진 시간동안 얼마나 많은 일을 처리했는가

<br>

- 프로세스 입장에서의 성능 척도
  - Turnaround time (소요시간, 반환시간)
  - Waiting time (대기 시간)
  - Response time (응답 시간)

<br>

### CPU Scheduling Algorithm

 #### FCFS (First-Come First-Served) : 먼저 온 프로세스 순서대로 처리

    Ex)  P1 -> P2 -> P3의 순서로 프로세스가 들어오고 각각 24, 3, 3의 Burst Time을 갖는다고 하자

    대기 시간 : P1 = 0, P2 = 24, P3 = 27 / 평균 대기 시간 : 17

    만약 P2 -> P3 -> P1 순서로 들어오면

    대기 시간 : P2 = 0, P3 = 3, P1 = 6 / 평균 대기 시간 : 3 으로 대기시간이 매우 줄어들게 된다.

  - Convoy effect : 위와 같이 긴 Burst Time을 갖는 프로세스가 하나 도착해서 짧은 Burst Time를 갖는 프로세스들이 지나치게 오래 기다려야하는 현상

<br>

 #### SJF (Shortest-Job-First) : FCFS의 Convoy effect를 해결하기 위해서 CPU Burst Time이 가장 짧은 프로세스를 제일 먼저 처리
