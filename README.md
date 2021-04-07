# todo-list
그룹프로젝트 #1



---

## Table

* Card
  * String title
  * String contents
  * LocalDateTime createDate
  * boolean todo
  * boolean doing
  * boolean done



* API URL

  * add: POST
    "/cards"

  * remove: DELETE
    "/cards"

  * move: PUT

    "/cards/{{id}}/status"

  * edit: PUT
    "/cards/{{id}}"

  * view: GET
    "/cards"