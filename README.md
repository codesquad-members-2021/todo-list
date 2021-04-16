# todo-list
그룹프로젝트 #1

[배포 주소](http://ec2-54-180-109-154.ap-northeast-2.compute.amazonaws.com:8080/)

## 팀 13 협업 규칙

### 이슈
- 이슈 태그
  - FE, BE : 대분류
  - Bug : 수정할 버그
  - Enhancement : 기능 추가
  - 의외의 항목들은 필요할 때 자유롭게 추가
- 생성된 이슈는 [Project](https://github.com/PizzaCola-K/todo-list/projects/1)에서 관리한다
- 완료된 이슈는 PR에 연결한 후, PR이 완료될 때 같이 닫는다


### 커밋 컨벤션
- 커밋 태그
  - feat : 새로운 기능 추가
  - fix : 버그 수정
  - docs : 문서의 수정
  - style : (코드의 수정 없이) 스타일(style)만 변경(들여쓰기 같은 포맷이나 세미콜론을 빼먹은 경우)
  - refactor : 코드를 리펙토링
  - test : Test 관련한 코드의 추가, 수정
  - chore : (코드의 수정 없이) 설정을 변경

### 브랜치 규칙
- main : 배포용
- FE, BE : 코드 리뷰용, PR 브랜치
- FE-dev : Seong, Rano가 분업한 코드를 합치는 브랜치
- FE-(author)-(feature) : 각각의 기능 구현 후 FE-dev로 PR
- BE-(feature) : 각각의 기능 구현 후 BE로 PR

## api 정리 (Work in Process)

### 기본 객체

#### Card
```json
{
    "card": {
        "columnId": 1,
        "cardId": 2,
        "previousCardId": 0,
        "title": "제목",
        "body": "내용"
    }
}
```

#### Column

```json
{
    "column": {
        "columnId": 1,
        "name": "해야 할 일",
        "cards": [
            {
                "columnId": 1,
                "cardId": 2,
                "previousCardId": 0,
                "title": "GitHub 공부하기",
                "body": "add, commit, push"
            },
            {
                "columnId": 1,
                "cardId": 1,
                "previousCardId": 2,
                "title": "블로그에 포스팅할 것",
                "body": "GitHub 공부 내용"
            }
        ]
    }
}

```

### 요청 주소

`GET /api/columns`

모든 칼럼의 정보를 가져옵니다.

```json
{
    "columns": [
        {
            "columnId": 1,
            "name": "해야 할 일",
            "cards": [
                {
                    "columnId": 1,
                    "cardId": 2,
                    "previousCardId": 0,
                    "title": "GitHub 공부하기",
                    "body": "add, commit, push"
                },
                {
                    "columnId": 1,
                    "cardId": 1,
                    "previousCardId": 2,
                    "title": "블로그에 포스팅할 것",
                    "body": "GitHub 공부 내용"
                }
            ]
        },
        {
            "columnId": 2,
            "name": "하고 있는 일",
            "cards": [
                {
                    "columnId": 2,
                    "cardId": 3,
                    "previousCardId": 0,
                    "title": "HTML/CSS 공부하기",
                    "body": "input 태그 실습"
                }
            ]
        },
        {
            "columnId": 3,
            "name": "완료된 일",
            "cards": []
        }
    ]
}

```

`GET /api/columns/:columnId`

하나의 칼럼의 정보를 가져옵니다.

```json
{
    "column": {
        "columnId": 1,
        "name": "해야 할 일",
        "cards": [
            {
                "columnId": 1,
                "cardId": 2,
                "previousCardId": 0,
                "title": "GitHub 공부하기",
                "body": "add, commit, push"
            },
            {
                "columnId": 1,
                "cardId": 1,
                "previousCardId": 2,
                "title": "블로그에 포스팅할 것",
                "body": "GitHub 공부 내용"
            }
        ]
    }
}

```

`POST /api/columns/:columnId/cards`

해당 칼럼에 카드를 추가합니다.

Request Body

```json
{
    "card" : {
        "title" : "추가한 카드 제목",
        "body" : "추가한 카드 내용"
    }
}

```

Response Body

```json
{
    "card": {
        "columnId": 1,
        "cardId": 9,
        "previousCardId": 0,
        "title" : "추가한 카드 제목",
        "body" : "추가한 카드 내용"
    }
}

```

`DELETE /api/columns/:columnId/cards/:cardId`

해당하는 칼럼의 카드를 삭제합니다.

`PUT /api/columns/:columnId/cards/:cardId`

카드의 내용을 수정합니다. 현재 카드 내용만 수정됩니다.

```json
{
    "card": {
        "columnId": 1,
        "cardId": 2,
        "previousCardId": 0,
        "title": "카드 수정",
        "body": "카드 수정"
    }
}

```

`GET /api/activities` (Not Working)

활동 내역을 보냅니다.

```json
{
    "activities" : [
        {
            "id":4,
            "actionUserId":1,
            "action":"삭제",
            "title":"GitHub 공부",
            "fromColumn":null,
            "toColumn":null,
            "actionTime":"2021-04-07T14:10:25.038"
        },{
            "id":3,
            "actionUserId":1,
            "action":"변경",
            "title":"GitHub 공부",
            "fromColumn":null,
            "toColumn":null,
            "actionTime":"2021-04-07T14:10:25.038"
        },{
            "id":2,
            "actionUserId":1,
            "action":"이동",
            "title":"git 공부",
            "fromColumn":"해야할 일",
            "toColumn":"하고있는 일",
            "actionTime":"2021-04-07T14:10:25.038"
        },{
            "id":1,
            "actionUserId":1,
            "action":"등록",
            "title":"git 공부",
            "fromColumn":null,
            "toColumn":"해야할 일",
            "actionTime":"2021-04-07T14:10:25.038"
        }
    ]
}

```


### 멤버
- Backend
  - K
- Frontend
  - Rano
  - Seong
