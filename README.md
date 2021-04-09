# Team-19

## 팀원
- Neis : FE [@Neis](https://github.com/cchoongh)
- Pengdori : FE [@Pengdori](https://github.com/dudn1933)
- Ppamppam : FE [@Ppamppam](https://github.com/ppamppamman)

## 규칙
- 대원칙 : 자율 규제
- 소원칙 : 설계 변경에는 전원 회의

## API 구조

- GET /todo/:id
- GET /column/:id/todos
- POST /column/:id/todo/
- PUT /column/:id/todo/:id
- DELETE /column/:id/todo/:id


## 프론트엔드 프로젝트 구조
![](https://user-images.githubusercontent.com/74038014/114139733-5eada500-994a-11eb-9706-15f493df186a.png)

## DB 모델
![](https://user-images.githubusercontent.com/13144573/114139751-63725900-994a-11eb-8dce-ee79a0d06dd6.png)
- RDBMS : MySQL 사용
- 백엔드 프로젝트 : express.js 사용

## Github 관리 전략
```
upstream
-> team-19

origin
  -> team-19
    (PR로 origin/team-19에 병합)
  -> dev
    (PR로 dev에 병합)

    -> feature/개발기능1 <-> local/feature/개발기능1
    -> feature/개발기능2 <-> local/feature/개발기능2
    -> feature/개발기능3 <-> local/feature/개발기능3
```