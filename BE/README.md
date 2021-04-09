# todo-list
그룹프로젝트 #1


## 팀원 구성
- BE
  - Bibi
  - Starve
- iOS
  - 쏭
  - yj

## 브랜치 관리

메인 브랜치
- Team-04

서브 브랜치
- 맨 앞에 소속(BE / iOS)을 적는다.
- `/` 이후 브랜치에서 작업할 내용을 서술한다.
- 개인 닉네임은 따로 작성하지 않는다.
- 예시 : `BE/create-card`

## Table

* Card
  * String title
  * String contents
  * LocalDateTime createDate
  * boolean todo
  * boolean doing
  * boolean done
  
* API URL

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