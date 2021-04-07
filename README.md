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
