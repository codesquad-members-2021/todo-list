# todo-list
그룹프로젝트 #1

# 브랜치 관리

프론트엔드와 백엔드 PR을 위한 frontend, backend 브랜치를 만듭니다.

이후에 frontend와 backend 브랜치에서 기능을 추가할 때 마다 브랜치를 만들고 frontend 또는 backend로 합칩니다.

이후에 PR을 upstream의 team-13으로 전송합니다.

배포 브랜치는 main입니다.

# api 정리 (Work in Process)

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

GET /api/cards
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

log, action
```json
{
    "log" : {
        "action" : "등록",
        "actionUser" : {
            "id" : 1,
            ...
        },
        "card" : {
            "id" : 2,
            "title" : "제목",
            "body" : "내용",
            "author" : {

            },
            "column" : {
                "id" : 1,
                "name" : "해야할 일",
            },
        },
        "prevColumn" : {
                "id" : 2,
                "name" : "해야할 일",
        },
        "actionTime" : time,
    }
}
```
