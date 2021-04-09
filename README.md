# Team-19

## 팀원
- Neis : FE [@Neis](https://github.com/cchoongh)
- Pengdori : FE [@Pengdori](https://github.com/dudn1933)
- Ppamppam : FE [@Ppamppam](https://github.com/ppamppamman)

## 규칙
- 대원칙 : 자율 규제
- 소원칙 : 설계 변경에는 전원 회의

## 프론트엔드 프로젝트 구조
![](https://user-images.githubusercontent.com/74038014/114139733-5eada500-994a-11eb-9706-15f493df186a.png)
- Container & Presentational 패턴을 활용해서 작업합니다.
  - Container -> 상태관리에 집중합니다.
  - Presentational -> DOM 그리기와 이벤트 등록에 집중합니다. 
- Styled Components를 활용해서 스타일 작업을 진행 중입니다.

## API
- GET /todo/:id 1개의 투두 카드를 받아옵니다.

- GET /column/:id/todos 1개의 컬럼에 종속된 여러개의 투두 카드를 받아옵니다.
- POST /column/:id/todo/ 투두 카드를 추가합니다.
- PUT /column/:id/todo/:id 투두 카드를 수정합니다.
- DELETE /column/:id/todo/:id 투두 카드를 삭제합니다.

- POST /history 히스토리 카드를 추가합니다.
- GET /histories 히스토리 카드 정보들을 받아옵니다.

## DB 모델
![](https://user-images.githubusercontent.com/13144573/114139751-63725900-994a-11eb-8dce-ee79a0d06dd6.png)
- RDBMS : sqlite3 사용 -> MySQL 사용 (M1맥 이슈)
- 백엔드 프로젝트 : express.js 사용

## Github 관리 전략
```
upstream
-> team-19

origin
  -> team-19
    (PR로 origin/team-19에 병합)
  -> dev
    (PR로 origin/dev에 병합)

    -> feature/개발기능1 <-> local/feature/개발기능1
    -> feature/개발기능2 <-> local/feature/개발기능2
    -> feature/개발기능3 <-> local/feature/개발기능3
```
- 커밋 : 자유롭게
- PR 전 리뷰가 되면 참 좋겠지만, 그냥 실시간으로 함께 확인합니다.

## 구현상황
- Mock 데이터로 작업중
![image](https://user-images.githubusercontent.com/13144573/114143315-f7deba80-994e-11eb-9dfa-6bec63639ce3.png)
![image](https://user-images.githubusercontent.com/13144573/114143628-57d56100-994f-11eb-8e23-5128490ed129.png)
