```bash
├──── baseball_game
    ├── baseball_game
       ├── Baseballgame.swift
       ├── main.swift
       └── SaveRecord.swift
```

# `Swift`로 야구게임 만들기

> 숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다. 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다. 예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.

## 필수 기능 과제 구현 

1. Lv1 `11/04 까지`
    - [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
    - [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

2. Lv2 `11/05 - 11/06 까지`
    - [ ]  정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
        - [ ]  힌트는 야구용어인 **볼**과 **스트라이크**입니다.
        - [ ]  같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
        - ex) 정답 : 456 인 경우
            - 435를 입력한 경우 → 1스트라이크 1볼
            - 357를 입력한 경우 → 1스트라이크
            - 678를 입력한 경우 → 1볼
            - 123를 입력한 경우 → Nothing
        - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
    - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
  
## 도전 기능 과제 구현 

1. Lv3 `11/06 까지`
    - [ ]  정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
        - 맨 앞자리에 0이 오는 것은 불가능합니다
            - 092 → 불가능
            - 870 → 가능
            - 300 → 불가능
         
2. Lv4 `11/07 까지`
- [ ]  프로그램을 시작할 때 안내문구를 보여주세요
     
1. Lv5 `11/07 까지`
- [ ]  2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다
- [ ]  1번 게임 시작하기의 경우 **“필수 구현 기능”** 의 예시처럼 게임이 진행됩니다
    - 정답을 맞혀 게임이 종료된 경우 위 안내문구를 다시 보여주세요
       
1. Lv 6 `11/07 까지`
- [ ]  3번 종료하기의 경우 프로그램이 종료됩니다
    - 이전의 게임 기록들도 초기화됩니다
     
### ~Lv6까지 구현 및 추가 기능
--------------------------------------------------------------------------
                  환영합니다 ! 원하시는 번호를 입력해주세요.
         1. 게임 시작하기   2. 게임 기록보기   3. 모든 기록 삭제  4. 게임 종료
--------------------------------------------------------------------------

1. 게임 시작시 유저 이름 받기
2. 게임을 종료하지 않고 게임 기록 삭제
3. 게임을 진행하는 도중 게임을 포기하고 메뉴 화면으로 돌아가기
4. 게임 기록 랭킹 순으로 출력 ( 누가 더 일찍 맞췄나)
      
#### 개발 환경

 - Version: Swift 6
 - IDE: Xcode 16.1
