# todo-list
그룹프로젝트 #1

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

```json
{
    "user" : {
        "id" : 1,
        "name" : "k"
    }
}
```

GET /api/card/:cid
```json
{
    "card" : {
        "id" : 1,
        "title" : "제목",
        "body" : "내용",
        "author" : {

        },
        "column" : "",
    },
}
```

column
```json
{
    "column" : {
        "id" : 1,
        "name" : "해야할 일",
    },
}

```

`GET /api/columns`
```json
{
    "columns" : [
        {
            "id" : 1,
            "name" : "해야할 일"
        },{
            "id" : 2,
            "name" : "하고 있는 일"
        },{
            "id" : 3,
            "name" : "완료한 일"
        }
    ]
}

```


`GET /api/cards`
```json
{
    "cards" : [
        {
            "id":1,
            "title":"GitHub 공부하기",
            "body":"add, commmit, push",
            "columnId":1
        },{
            "id":2,
            "title":"블로그에 포스팅할 것",
            "body":"GitHub 공부내용 모던 자바스크립트 1장 공부내용",
            "columnId":1
        },{
            "id":3,
            "title":"모던 자바스크립트 예제 실습",
            "body":"1장 예제 내용 실습 후, 커밋까지",
            "columnId":2
        },{
            "id":4,
            "title":"HTML/CSS 공부하기",
            "body":"input 태크 실습+노션에 유형 정리",
            "columnId":2
        }
    ]
}

```

`GET /api/activities`
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
