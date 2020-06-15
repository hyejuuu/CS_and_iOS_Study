### 퀵 정렬

퀵정렬이란 피벗을 기준으로 큰 값과 작은 값을 서로 교체하는 정렬방법입니다.

서로 값을 교체하는데 N번, 전체 원소를 반으로 나누는데 평균적으로 logN번이 소요되기 때문에 평균적으로 NlogN의 시간 복잡도를 가집니다.

*과정*

1. 원소들 중에서 임의의 원소를 하나 선택합니다. 이것을 pivot이라고 합니다. 
2. 피벗을 제외한 가장 왼쪽에서 부터 pivot보다 큰 값(left)을 찾고, 가장 오른쪽에서부터 pivot보다 작은 값(right)을 찾습니다.
3. 그리고 그 두 값의 위치를 바꿔줍니다.
4. 만약 두 값의 위치가 서로 엇갈린다면, 즉 left보다 right가 더 왼쪽에 위치한다면 피벗과 right의 자리를 바꿔줍니다.
5. 피벗의 왼쪽과 오른쪽으로 나눠서 과정을 재귀적으로 반복해줍니다.
6. 원소들의 크기가 0이되면 정렬을 멈춥니다.
