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

## CPU Scheduling 성능 척도

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
    - 본인이 CPU를 쓰고자하는 queue에 들어가서 최초로 CPU를 얻기까지의 시간

<br>

## CPU Scheduling Algorithm

 ### FCFS (First-Come First-Served) : 먼저 온 프로세스 순서대로 처리

    Ex)  P1 -> P2 -> P3의 순서로 프로세스가 들어오고 각각 24, 3, 3의 Burst Time을 갖는다고 하자
    
    대기 시간 : P1 = 0, P2 = 24, P3 = 27 / 평균 대기 시간 : 17
    
    만약 P2 -> P3 -> P1 순서로 들어오면
    
    대기 시간 : P2 = 0, P3 = 3, P1 = 6 / 평균 대기 시간 : 3 으로 대기시간이 매우 줄어들게 된다.

  - Convoy effect : 위와 같이 긴 Burst Time을 갖는 프로세스가 하나 도착해서 짧은 Burst Time를 갖는 프로세스들이 지나치게 오래 기다려야하는 현상

<br>

 ### SJF (Shortest-Job-First) : FCFS의 Convoy effect를 해결하기 위해서 CPU Burst Time이 가장 짧은 프로세스를 제일 먼저 처리

SJF는 preemptive인 경우 minimum average waiting time을 보장한다. 

- 비선점형(Non-preemptive)
  - CPU를 잡으면 이번 CPU Burst time이 끝날 때까지 CPU를 뺏기지 않는다.
- 선점형(preemptive)
  - 현재 수행중인 프로세스의 남은 CPU Burst time보다 더 짧은 CPU Burst time을 갖는 프로세스가 도착하면 CPU를 빼앗긴다. --> Shortest-Remaining-Time-First(SRTF)



**SJF의 문제점**

- CPU Burst time이 긴 프로세스는 평생 CPU를 사용할 수 없기 때문에 starvation이 발생할 수 있다. 
- CPU Burst time을 미리 알 수 없기 때문에 실질적으로 SJF를 사용하기엔 무리가 있다. 과거의 CPU Burst time을 보고 추정할 수는 있다.

<br>

### Priority Scheduling : 우선 순위가 높은 프로세스 먼저 처리

priority number는 정수로 표현되며 낮을수록 priority가 높다.

CPU Burst time을 priority로 놓으면 SJF --> 즉, SJF도 일종의 Priority Scheduling이다. 

우선순위가 낮은 프로세스는 영원히 실행되지 않을 수 있어 Starvation이 발생할 수 있다. Starvation은 기다리는 시간이 증가할수록 priority를 높여주는 Aging기법을 사용해서 해결할 수 있다.

<br>

### Round Robin (RR)

각 프로세스는 동일한 할당시간(time quantum)을 갖고 할당시간이 지나면 프로세스는 CPU를 빼앗긴다. 사용하던 프로세스는 ready queue의 제일 뒤로 가서 줄을 선다.

--> n개의 프로세스가 ready queue에 있고 할당 시간이 q time unit일 경우 어떤 프로세스도 (n-1)q time unit 이상 기다리지 않는다. 

할당 시간이 길 경우 FCFS와 동일하고, 짧을 경우 context switch가 너무 자주 발생하기 때문에 오버헤드가 커진다.

- RR의 장점
  - 일반적으로 SJF보다 average turnaround time은 길지만 response time은 더 짧다.
- RR은 CPU Burst time이 비슷한 job들만 있을 때 사용한다면 빨리 끝내는 작업없이 모두 같은 시간에 작업이 완료되기 때문에 long job과 short job이 섞여있을 때 사용하면 효과적이다.

<br>

### Multilevel queue

- Ready queue를 여러개로 분할

  - Foreground ( interactive한 job )
  - Background ( CPU를 오래 사용하는 batch job )

- 각 queue는 독립적인 스케줄링 알고리즘을 가진다.

  - Foreground queue는 RR을 사용한다. --> interactive job이기 때문에 응답시간이 빨라야한다.
  - Background queue는 FCFS를 사용한다. --> long job들이 있는데 long job들은 CPU를 자주 줬다 뺏는게 더 비효율적이기 때문

- queue에 대한 스케줄링이 필요하다.

  - Fixed Priority Scheduling
    - Foreground queue의 프로세스가 모두 실행된 다음에 Background queue의 프로세스가 실행된다.

      --> Background queue에 대해서 starvation이 발생할 수 있다.

  - Time Slice

    - 각 큐에 CPU Time을 적절한 비율로 할당한다.
    - ex) Foreground queue에 80%, Background queue에 20%를 할당

    

  - queue의 우선순위

    - System processes --> highest priority

    - Interactive processes

    - Interactive editing processes

    - batch processes

    - student processes --> lowest priority

      --> Multilevel queue에서 우선순위가 정해진 프로세스는 queue간의 이동이 불가능하다.

<br>

### Multilevel Feedback Queue

Multilevel Queue와 동일하게 여러 queue가 존재하지만 프로세스가 queue간 이동이 가능하다.

aging기법을 Multilevel Feedback Queue의 방식으로 구현할 수 있다.

ex)

Q0 - time quantum 8 milliseconds

Q1 - time quantum 16 milliseconds

Q2 - FCFS

new job은 우선순위가 가장 높은 Q0으로 들어간다. 

CPU를 잡아서 8 milliseconds동안 완료하지 못한다면 Q1에 줄을 서서 기다린다.

CPU를 다시 잡아 16 milliseconds동안 작업을 완료하지 못하면 Q2에 줄을 서서 기다려서 수행되게 된다.

<br>

## Real-time Scheduling

real-time system에서의 Scheduling은 deadline이 존재하며 빨리 처리하는 것이 중요한게 아니고 deadline을 만족시키는 것이 중요하다.

<br>

## Thread Scheduling

- Local Scheduling --> 운영체제가 스케줄하는 게 아님
  - User level thread는 운영체제는 쓰레드의 존재를 모르고 사용자 프로세스 본인이 내부에 쓰레드를 여러개 둔 경우이기 때문에 사용자 프로세스 본인이 thread library에 의해 어떤 thread를 스케줄할 지 결정한다.
- Global Scheduling 
  - kernel level thread는 운영체제가 thread의 존재를 아는 경우로 일반 프로세스와 마찬가지로 커널의 단기 스케줄러가 어떤 thread를 스케줄할 지 결정한다.
