# Todo 백엔드 서버

* Todo 백엔드 서버입니당



## API Document

### 1. USER

#### 1-1. 로그인

##### 요청 메서드와 URL

* POST

* /api/users/login

#### 1-2. 로그아웃

##### 요청 메서드와 URL

* POST

* /api/users/logout

### 2. COLUMN

#### 2-1. 컬럼 목록 조회

##### 요청 메서드와 URL

* GET

* /api/columns

##### 설명

* 사용자가 소유한 TODO-LIST의 모든 컬럼을 응답합니다
* 로그인된 사용자만 이용할 수 있는 API이다.
* 따라서, URL이나 Request Body에 유저의 아이디를 넣을 필요가 없습니다.

##### JSON 포맷

* ```json
  {
  	[
          {
              "id" : 1,
              "columnTitle" : "TODO",
              "taskList" : [
                  {  },
                  {  }
              ]
          },
          {
              "id" : 2,
              "columnTitle" : "IN_PROGRESS",
              "taskList" : [
                  {  },
                  {  }
              ]
          }
      ]
  }
  ```

### 3. TASK

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
* 로그인된 사용자만 이용할 수 있는 API이다.
* 따라서, URL이나 Request Body에 유저의 아이디를 넣을 필요가 없다.

##### JSON 포맷

* ```json
  {
  	"id" : 1,
      "taskTitle" : "모던 자바스크립트 예제 실습",
      "taskContent" : "1장 예제 내용 실습 후 커밋까지",
      "createdDateTime" : 2021-03-21 13:24:00,
      "updatedDateTime" : null
  }
  ```



