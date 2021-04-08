# Todo 백엔드 서버

* Todo 백엔드 서버입니당



# API Document

## 1. User

#### 1-1. 로그인

##### 요청 메서드와 URL

* POST

* /api/users/login

##### Request Body

* userId
  * ex : "모던 자바스크립트 예제 실습"
* password
  * ex : "1장 예제 내용 실습 후 커밋까지"

#### 1-2. 로그아웃

##### 요청 메서드와 URL

* POST

* /api/users/logout



## 2. Column

#### 2-1. 컬럼 목록 조회

##### 요청 메서드와 URL

* GET

* /api/columns

##### 설명

* 사용자가 소유한 TodoList의 모든 컬럼을 응답합니다
* 로그인된 사용자만 이용할 수 있는 API이다.
* 따라서, URL이나 Request Body에 유저의 아이디를 넣을 필요가 없습니다.

##### JSON 포맷

* ```json
  [
      {
          "id": 1,
          "columnTitle": "TODO",
          "taskList": [
              {
                  "id": 1,
                  "taskTitle": "task1",
                  "taskContent": "taskContent1",
                  "author": {
                      "id": 1,
                      "name": "라쿠운",
                      "userId": "Racoon",
                      "password": "1234",
                      "profileImage": ""
                  },
                  "createdDateTime": "2021-04-07T17:51:05.398",
                  "updatedDateTime": null
              },
              {
                  "id": 2,
                  "taskTitle": "task2",
                  "taskContent": "taskContent2",
                  "author": {
                      "id": 1,
                      "name": "라쿠운",
                      "userId": "Racoon",
                      "password": "1234",
                      "profileImage": ""
                  },
                  "createdDateTime": "2021-04-07T17:51:05.399",
                  "updatedDateTime": null
              }
          ]
      },
      {
          "id": 2,
          "columnTitle": "IN_PROGRESS",
          "taskList": [
              {
                  "id": 3,
                  "taskTitle": "task3",
                  "taskContent": "taskContent3",
                  "author": {
                      "id": 1,
                      "name": "라쿠운",
                      "userId": "Racoon",
                      "password": "1234",
                      "profileImage": ""
                  },
                  "createdDateTime": "2021-04-07T17:51:05.399",
                  "updatedDateTime": null
              }
          ]
      }
  ]
  ```

* 중복된 author은 제거할지 말지 고민중입니다



## 3. Task

#### 3-1. 태스크 생성

##### 요청 메서드와 URL

* POST

* /api/columns/:columnId/tasks

##### Request Body

* taskTitle 
  * ex : "모던 자바스크립트 예제 실습"
* taskContents
  * ex : "1장 예제 내용 실습 후 커밋까지"

##### 설명

* 태스크를 생성하는 API입니다.
* 로그인된 사용자만 이용할 수 있는 API입니다.

##### JSON 포맷

* ```json
  {
      "id" : 1,
      "taskTitle" : "모던 자바스크립트 예제 실습",
      "taskContent" : "1장 예제 내용 실습 후 커밋까지",
      "createdDateTime" : "2021-03-21 13:24:00",
      "updatedDateTime" : null,
      "author" : {
          "id" : 1,
          "userId" : "Raccoon",
          "password" : "1234",
          "name" : "라쿠운",
          "profileImage" : "http://어딘가에_있는_라쿤_이미지.jpeg"
      }
  }
  ```



#### 3-2. 태스크 변경

##### 요청 메서드와 URL

* PUT

* /api/columns/:columnId/tasks/:taskId
  * URL에 있는 columnId는 수정 전에 태스크가 위치한 컬럼의 아이디 입니다

##### Request Body

* taskTitle 
  * ex : "모던 자바스크립트 예제 실습 변경됨!"
* taskContents
  * ex : "1장 예제 내용 실습 후 커밋까지 변경됨!"
* columnId
  * ex : 1, 수정 후, 태스크가 위치한 컬럼의 아이디입니다.

##### 설명

* 태스크를 변경하는 API입니다.
* 로그인된 사용자만 이용할 수 있는 API입니다.

##### JSON 포맷

* 수정에 성공하면 200 상태코드로 응답이 온다.
* 실패하면 200 상태코드 외의 에러코드로 응답이 온다.



#### 3-3. 태스크 삭제

##### 요청 메서드와 URL

* DELETE

* /api/columns/:columnId/tasks/:taskId

##### Request Body

* 없음

##### 설명

* 태스크를 삭제하는 API입니다.
* 로그인된 사용자만 이용할 수 있는 API입니다.

##### JSON 포맷

* 수정에 성공하면 200 상태코드로 응답이 온다.
* 실패하면 200 상태코드 외의 에러코드로 응답이 온다.



## 4. TodoLog

#### 4-1. 로그 조회

##### 요청 메서드와 URL

* GET

* /api/logs

##### Request Body

* 없음

##### 설명

* 로그 목록을 불러오는 API입니다
* 로그를 최신순으로 5개만 응답합니다
* 로그인된 사용자만 이용할 수 있는 API입니다.

##### JSON 포맷

* ```json
  [
      {
          "id" : 1,
          "action" : "'move' '자바스크립트 예제 실습 수정됨!' 'TODO' 'IN_PROGRESS'",
          "author" : {
              "id" : 1,
              "userId" : "Raccoon",
              "password" : "1234",
              "name" : "라쿠운",
              "profileImage" : "http://어딘가에_있는_라쿤_이미지.jpeg"
          },
          "createdDateTime" : "2021-03-21 13:24:00"
      }
  ]
  ```

