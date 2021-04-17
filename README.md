# todo-list
그룹프로젝트 #1

## 팀원 구성

그룹1 팀4
- BE
  - Bibi
  - Starve
- iOS
  - 쏭
  - yj

## 팀 규칙

- 매일 아침, 점심에 상황을 공유합니다
- 필요할 때 수시로 Zoom 소회의실을 만들어 서로 질문합니다

## 할 일 정리

[구글 스프레드시트](https://docs.google.com/spreadsheets/d/1li3tctYu8iJERF31gTGSMQ148DXK6w4OkF0JOh5DsSs/edit#gid=0) 에 별도로 정리

## 브랜치 관리

메인 브랜치
- Team-04

서브 브랜치
- 맨 앞에 소속(BE / iOS)을 적는다.
- `/` 이후 브랜치에서 작업할 내용을 서술한다.
- 개인 닉네임은 따로 작성하지 않는다.
- 예시 : `BE/create-card`

## 테이블 설계

* Card
  * String title
  * String contents
  * LocalDateTime createDate
  * boolean todo
  * boolean doing
  * boolean done
  

## API URL convention

  * crate
    * POST "/cards"

  * read
    * GET "/cards"

  * move
    * PUT "/cards/{id}/todo"
    * PUT "/cards/{id}/doing"
    * PUT "/cards/{id}/done"

  * update
    * PUT "/cards/{id}" 

  * delete
    * DELETE "/cards/{id}"
