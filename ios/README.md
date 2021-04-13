# (할 일 리스트)ToDoListApp
## Major Implementation
### 1. (branch feature_data_model) ToDo 아이템 데이터 모델 구현 Tue Apr 6 17:36:27 2021 +0900
#### Major features
- [x] 후에 생성될 DB api를 대신할 ToDo 아이템 mock json 데이터를 불러온다. 
- [x] json 데이터에 맞는 데이터 모델을 구현한다.
- [x] 불러온 데이터를 파싱하는 클래스를 구현한다.
- [x] 데이터를 불러오고 json 데이터를 파싱하는 작업을 확인하는 유닛 테스트를 구현한다.

#### Study keywords
- URLSession
- JSON
- Codable

### 2. (branch feature_todo_table) ToDoCards 로직 생성
#### Major features
- [x] ToDoCardProtocol 구현
- [x] ToDo 상태에 따른 카드 객체 클래스 생성

#### Study keywords
- 데이터 구조 (Array)

### 3. (branch feature_card_colums_UI) Card 객체를 화면에 뿌려주는 기능 구현 Fri Apr 9 13:00:21 2021 +0900
#### Major features
- [x] ToDoCardProtocol 구현
- [x] ToDo 상태에 따른 카드 객체 클래스 생성
- [x] Custom tableView header, footer 구현

#### Study keywords
- Container View
- Table View Data Source
- UITableViewHeaderFooterView

### 4. (branch feature_api_requests) Card 객체를 화면에 뿌려주는 기능 구현 Mon Apr 12 18:35:47 2021 +0900
#### Major features
- [x] api GET request 구현
- [x] api POST request 구현
- [x] api DELETE request 구현

#### Study keywords
- URLRequest
- JSONSerialization

### 5. (branch feature_api_requests) Card 객체를 화면에 뿌려주는 기능 구현 Tue Apr 13 18:28:53 2021 +0900
#### Major features
- [x] TableView delegates 별도의 파일로 이동
- [x] api 변경에 대응 및 HTTP request 로직 개선
- [x] 필요없는 class들 제거
- [x] 테이블 뷰 셀 swipe and delete 기능 구현 

#### Study keywords
- UITableViewCell swipe actions
