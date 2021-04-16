# todo-list

[기능 요구사항 정리](https://docs.google.com/spreadsheets/d/1zy6ksZx3HCCSO902DXXou9YLyXpUDjSixnSW6KHOLn0/edit?usp=sharing)

## 브랜치 전략

* iOS 공통작업 브랜치 : iOS_develop
* BE 공통작업 브랜치 : BE_develop
* iOS/BE 공통작업 브랜치 : develop
* 최종작업 브랜치 : main(default)

## 팀원 소개

우리는 모두 코딩 요정들 입니다.

### IOS

* Lia : 뷰 깎는 요정 🧚
* Min : 🍻 맥주마시는 코딩요정 🧚‍♂️

### BE

* Jane : NPE와 절친된 밤코요정 🧚
* Robin : 힘듦 공감러 DB요정 🧚


## 팀 규칙(스크럼 방식, 회의시간, 참여시간, 코딩스타일 등)

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

## 할일 정리

* [IOS] https://github.com/janeljs/todo-list/projects/3
* [BE] https://github.com/janeljs/todo-list/projects/2

## 기능설명

### 동작화면
![ezgif com-gif-maker](https://user-images.githubusercontent.com/69951890/114976939-ca02f400-9ec1-11eb-9f50-41d5e3e9e8ca.gif)

1. 카드추가기능
   - 최대 3줄까지 출력됨.

2. 카드이동기능 (Drag & Drop)
   - 포스트타임 기준으로 자동정렬.
   - TodoList 개수에 따른 Label Update.
   
3. 카드삭제기능
    - 왼쪽으로 swipe 삭제
    - 길게 눌러 ContextMenu에서 삭제

4. 카드수정기능
    - 같은 모달뷰를 재사용했다. 

5. ContextMenuItem
<img width="1134" alt="스크린샷 2021-04-16 오후 2 55 10" src="https://user-images.githubusercontent.com/69951890/114978215-e56efe80-9ec3-11eb-9615-a19237b89322.png">

### Network

1. NotificationCenter를 이용한 옵저버패턴 구현

2. Result<Succss, Failure> 를 이용한 Exception Handling 구현
