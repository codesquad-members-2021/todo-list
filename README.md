# todo-list
그룹프로젝트 #1

## 진행상황
| 번호 | 기능 | 메서드 | url | 설명/리턴|완료 |
|:---:|:---:|:---:|:---:|:---:|:---:|
|1| 전체목록 조회|GET|/board/lists|JSON|O|
|2| todo 목록 조회|GET|/board/todo|JSON|O|
|3| progress 목록 조회|GET|/board/progress|JSON|O|
|4| done 목록 조회|GET|/board/done|JSON|O|
|5| 카드 생성하기 | POST |/board/lists|JSON|O|
|6| 카드 내용보기 |GET|/board/{id}|JSON|X|
|7| 카드 수정하기 |POST|/board/lists/{id}| JSON  |X|
|8| 카드 삭제하기 |DELETE|/board/lists/{id}| JSON |O|
|9| 포스트 완료한 일로 이동|POST|/board/done/{id}| JSON |X|
|10| 포스트 이동|POST|/board/{id}?move=@| 성공/실패 |X|
