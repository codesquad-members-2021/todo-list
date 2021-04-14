# todo-list(Team-06)



#### 📚 [project](https://github.com/okstring/todo-list/projects/1)

#### 📚 [Wiki](https://github.com/okstring/todo-list/wiki/%5BBE%5D-기능-목록)



## 👩‍💻 팀원 소개

Shion(BE), Bongf(BE), Zeke(iOS), Isaac(iOS)



## 🦥 브랜치 전략



### Branch

|        | Local                           | Origin                                                       | Upstream                                       |
| ------ | ------------------------------- | ------------------------------------------------------------ | ---------------------------------------------- |
| URL    |                                 | okstring/todo-list                                           | codesquad-members-2021/todo-list               |
| Branch | 클래스별(예시: BE-feature-init) | be-dev, ios-dev,  team-06(iOS + BE), 클래스별(예시: BE-feature-init) | team-06                                        |
| Rule   | 클래스별 branch에서 작업        | 클래스별 완성된 기능 be-dev, ios-dev에 PR open 팀원끼리 코드 리뷰 후 머지 | origin be-dev, ios-dev를 upstream team-06에 PR |



## 📒 팀의 규칙



### 팀 규칙

- 웹백엔드/모바일 저장소를 폴더로 구분한다.
- 브랜치 관리 규칙 : 각 클래스별로 기능단위로 브랜치를 생성한다.
- 깃헙 이슈관리나 프로젝트를 적극 활용한다.

### 백엔드 규칙

- 함께 멀리 가는 짝 페어 프로그래밍을 지향한다.
- 긍정적인 피드백을 제공한다. 부정적인 피드백은 금지.

### iOS 규칙

- 결과에 중요시하기 보다는 프로젝트 과정에서 즐거움을 찾기 위해 노력.
- 같은 파일 수정할때는 의논하고 기본적으로 서로 다른 파일을 작성해야 한다.



## 📃 할일 정리

 - 일주일에 한 번은 무조건 팀 회고를 하도록 한다.
 - github issus를 통해서 할 일을 공유한다.
 - slack private 채팅을 통해 친목도모



## 💾 API 구조

[mockup url](https://793ff2e3-7dec-416a-a0e4-09f4c24be362.mock.pstmn.io/api/cards)

```json
{
   "cards":[
      {
         "id":1,
         "title":"GitHub 공부하기",
         "contents":"add, commmit, push",
         "column_id":1,
         "media":"WEB"
      },
      {
         "id":2,
         "title":"블로그에 포스팅할 것",
         "contents":"GitHub 공부내용 모던 자바스크립트 1장 공부내용",
         "column_id":1,
         "media":"APP"
      },
      {
         "id":3,
         "title":"HTML/CSS 공부하기",
         "contents":"input 태크 실습+노션에 유형 정리",
         "column_id":2,
         "media":"WEB"
      }
   ]
}
```