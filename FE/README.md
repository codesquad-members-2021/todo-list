![](file:///var/folders/qj/fllt35893m5bz926_w32hbd40000gn/T/TemporaryItems/NSIRD_screencaptureui_AQNIbt/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-04-09%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%204.37.21.png)## 브랜치 전략

PR branch - step\* 프론트엔드 개발 - FEdev
![branch](https://user-images.githubusercontent.com/71166372/114145273-307f9380-9951-11eb-9d71-8edabda939f3.JPG)

#### 순서

**백엔드(Hiro)**

- step branch에 바로 PR 후 merge

**프론트엔드(Q, Goody)**

1. FEdev branch에 각 local에서 개발한 코드를 PR 후 merge
2. 그 다음 step branch로 다시 PR 후 merge **(step에 바로 올렸을 시 충돌 방지 - FE에서 해결)**
3. FEdev -> step\* 으로 PR 후 merge

**개발 완료 후 PR 과정**

1. 완료된 step branch는 upstream으로 PR - (upstream team16 <= origin step\*)
2. rebase는 한명이 한다. 다른 팀원에게 알려준다. 다른 팀원은 git pull origin team16
3. team16 branch에서 새로운 step2, FEdev 브랜치 생성
4. step1과 이전의 FEdev branch는 삭제한다.
5. 반복

## 팀원 소개

hiro : 안녕하세요 히로 입니다

Q : 히로는 프로젝트 끝날 때까지 빈페이지만 볼 수도...

Goody : Q의 조수 구디입니다~

## 팀의 규칙

- 스크럼 방식
  아침 10시 ~ 10시 30분 - 자신이 무엇을 했는지, 오늘 계획이 어떻게 되는지 이야기

- 회의 시간
  오후 9시 (최대 1시간)
  API 맞추기 (데이터 형식, 어떻게 주고 받나?)
  그 날 생긴 오류
  나아갈 방향

- 코딩 스타일
  (FE) FE 두명끼리 맞춘다.
  (BE) Hiro 맘대로

boardId

title

content

## 할 일 정리

FE:

- 전체적인 UI틀 마무리
- Form data로 post 보내기
- 카드 생성 및 수정 구현
- css in js(styled-components) 적용
- 최대한 잘게 나누기
-

BE:

- column별 task출력 api만들기
- update 요청시 task 수정기능 구현
- delete 요청시 column, task 삭제기능 구현

<img width="754" alt="스크린샷 2021-04-09 오후 5 10 46" src="https://user-images.githubusercontent.com/71166372/114152059-c4a12900-9958-11eb-8fad-a9a8f8e6b8a2.png">

### JSON 데이터 형식 (04.08 수정)

```
[
  {
    "userID": "Q", (x)
    "columns": [		==> "board"
      {
        "id": 1,
        "title": "해야할 일",
        "cards": [
          {
            "id": 1,
            "title": "리액트 연습",
            "content": "리액트를 연습해보자",
            "author": "hiroGoodyQ", (x)
            "time": "2021-02-01" ( 분초까지)
          }
        ]
      },
      {
        "id": 2,
        "title": "하고 있는 일",
        "cards": [
          {
            "id": 1,
            "title": "이거는 진행중",
            "content": "리액트를 연습해보는중이다",
            "author": "hiroGoodyQ",
            "time": "2021-02-01"
          }
        ]
      },
      {
        "id": 3,
        "title": "완료한 일",
        "cards": [
          {
            "id": 1,
            "title": "이거는 끝났다.",
            "content": "리액트를 연습했다",
            "author": "hiroGoodyQ",
            "time": "2021-02-01"
          }
        ]
      }
    ]
  }
]
```

### 하드코딩 user (POST)

```
{
  id: hiroGoodyQ
  password:1234
}
```

## API url 형식

### Board

POST) /boards/  
<br>
GET) /boards/{boardId}
<br>
DELETE) /boards/{boardId}
<br>
PUT) /boards/{boardId}
<br>

### Card

POST) /{boardId}/cards
<br>
GET) /{boardId}/cards
<br>
DELETE) /{boardId}/cards
<br>

- board

  - card

- log

- user

### POST

form 형식으로 보내줄 것
