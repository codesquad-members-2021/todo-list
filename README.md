# Team-19

## 팀원
- Neis : FE [@Neis](https://github.com/cchoongh) "좌빰 우펭 비행기✈️ 속에서 열심히 공부중…"
- Pengdori : FE [@Pengdori](https://github.com/dudn1933) "좌빰 우네 비행기✈️✈️ 속에서 열심히 공부중…"
- Ppamppam : FE [@Ppamppam](https://github.com/ppamppamman) "불시착합니다... 자리에 앉아서 벨트를 채워주세요;;"

## 규칙
- 대원칙 : 자율 규제
- 소원칙 : 설계 변경에는 전원 회의

## 프론트엔드 프로젝트 구조
- 추상화된 컴포넌트 구조  
![image](https://user-images.githubusercontent.com/74038014/114139733-5eada500-994a-11eb-9706-15f493df186a.png)

- 컴포넌트 디렉토리  
![image](https://user-images.githubusercontent.com/13144573/114145621-953aee00-9951-11eb-80e7-b39d2a1ee37e.png)

- 작업 특이 사항
  - Container & Presentational 패턴을 활용해서 컴포넌트 작업을 하고 있습니다.
    - Container -> 상태관리에 집중합니다.
    - Presentational -> DOM 그리기와 이벤트 등록에 집중합니다. 
  - Styled Components를 활용해서 스타일 작업을 진행 중입니다.

## 컴포넌트의 역할
- MainPage : 엔트리포인트가 되며, 투두 컴포넌트들로부터 dispatch되는 액션을 핸들링합니다.
- TodoCard : 투두카드를 렌더하고 추가 수정 삭제하는 기능을 구현합니다.
- TodoColumn : 투두카드를 컬럼단위로 정렬할 수 있도록 기능을 구현합니다.
- TodoColumnContainer : 투두카드의 드래그앤 드랍을 구현합니다.
- SideNavigation : 히스토리의 목록을 렌더합니다.

## API
- GET /todo/:id 1개의 투두 카드를 받아옵니다.

- GET /column/:id/todos 1개의 컬럼에 종속된 여러개의 투두 카드를 받아옵니다.
- POST /column/:id/todo/ 투두 카드를 추가합니다.
- PUT /column/:id/todo/:id 투두 카드를 수정합니다.
- DELETE /column/:id/todo/:id 투두 카드를 삭제합니다.

- POST /history 히스토리 카드를 추가합니다.
- GET /histories 히스토리 카드 정보들을 받아옵니다.

## DB 모델
![image](https://user-images.githubusercontent.com/13144573/114156079-282d5580-995d-11eb-9e27-3a55dc43628e.png)
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
