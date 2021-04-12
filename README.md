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
|8| 카드 삭제하기 |DELETE|/board/lists/{id}| JSON |X|
|9| 포스트 완료한 일로 이동|POST|/board/done/{id}| JSON |X|
|10| 포스트 이동|POST|/board/{id}?move=@| 성공/실패 |X|

## 해결해야 할 일
1. 도커를 사용하지 말아라
2. mysql의 boolean 타입은 1,0 인데 true false로 반환을 어떻게 하나??
3. Auto_Increment 시 row를 삭제할시 순서가 달라진다.
4. jdbc로 soft delete 구현
5. iOS분들의 테스트를 위한 id 값이 잘 들어간 db와 api 배포하기
