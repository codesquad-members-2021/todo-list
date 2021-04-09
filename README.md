# todo-list
그룹프로젝트 #1

### 브랜치 전략

* iOS 공통작업 브랜치 : iOS_develop
* BE 공통작업 브랜치 : BE_develop
* iOS/BE 공통작업 브랜치 : develop
* 최종작업 브랜치 : main(default)

### 팀원 소개

#### IOS

* Lia : 뷰 깎는 요정 🧚
* Min : 🍻 맥주마시는 코딩요정 🧚‍♂️

#### BE

* Jane : 디버깅, 디버깅, 디버깅, NPE는 언제까지 나를 쫓아다닐 건지! 한 번에 문제를 해결하지는 못하지만 해결해내고야마는 밤코요정 🧚
* Robin : 힘듦 공감러 DB요정~! 🧚


### 팀 규칙(스크럼 방식, 회의시간, 참여시간, 코딩스타일 등)

* 스크럼 방식 : 자유롭게 ~!
* 회의 시간  : 언제든 ~!
* 참여시간   : 수시로 ~!
* 코딩스타일  : 알아서 ~!

1. IOS / BE 별로 프로젝트 생성해서 작업 진행사항 작성   
[예시 IOS]
<img width="506" alt="image" src="https://user-images.githubusercontent.com/45054467/114116247-470cf700-991f-11eb-8b3e-a12f577bb16e.png">

2. 기능 별로 PR 보내기  
[예시 BE]  
<img width="506" alt="image" src="https://user-images.githubusercontent.com/45054467/114116450-b4b92300-991f-11eb-8a67-b17cbb0c18d6.png">

3. 버그가 발생하는 상황 이슈 발행하기
<img width="506" alt="image" src="https://user-images.githubusercontent.com/45054467/114117403-918f7300-9921-11eb-874f-566352ea19ef.png">

4. 즐겜하기~!😄 (우리 모두 즐겁게 코딩하자!)

### 할일 정리

* [IOS] https://github.com/janeljs/todo-list/projects/3
* [BE] https://github.com/janeljs/todo-list/projects/2


### API 구조등

* category

``` Json
[
    {"todo": [
              { 
                  "title": "오늘의 할일",
                  "contents": "안녕하세요",
                  "user": {
                           "name": "min",
                           "profileUrl":"https:image-string-dfsd.jpg"
                  },
                  "postTime" : "2021-04-09 02:17:38" 
              },
              {
                  "title": "오늘의 할일2",
                  "contents": "안녕하세요2",
                  "user": {
                           "name": "jane",
                           "profileUrl":"https:image-string-dfsd.jpg"
                  },
                  "postTime" : "2021-04-09 02:17:38" 
              }
    ]}, 
    {"doing": [
              { 
                  "title": "오늘의 할일3",
                  "contents": "안녕하세요3",
                  "user": {
                           "name": "lia",
                           "profileUrl":"https:image-string-dfsd.jpg"
                  },
                  "postTime" : "2021-04-09 02:17:38" 
              }
    ]}, 
    {"done": [card]}
]
```

* history (이 부분은 고민을 해보기로~ 아직 결정이 되지 않음.)

``` Json
[{ 
          "card" :{              
                    "title": "오늘의 할일",
                    "contents": "안녕하세요",
                    "user": {
                                "name": "min",
                                "profileUrl":"https:image-string-dfsd.jpg"
                             },
                     "postTime" : "2021-04-09 02:17:38" 
                   },
          "status" : "update"
}]  
```



프로젝트와 관련된 내용을 정리해주세요
저장소만 봐도 어떤 일들이 있었는지 알 수 있도록 자료를 남기는 것은 중요합니다. 
내일 데모 활동은 오후 4시에 시작해서 6시까지 공통 수업용 줌회의실에서 진행합니다
각 팀별로 readme에 정리한 팀활동한 내용을 공유해주세요. 어떤 일을 누가 했느냐보다 얼마나 즐겁게 협업했느냐를 자랑해주세요.
발표자료를 만들 필요는 없습니다. 프로젝트를 하면서 했던 회의록도 좋고, 설계하면서 만든 자료도 좋고 뭐든지 그대로 공유해주세요.
6시 전체 활동이 끝나면 팀별 회고를 하고 한 주를 마무리하시면 됩니다.
