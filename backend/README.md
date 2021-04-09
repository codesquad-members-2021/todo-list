## 전체 구현 과정

1. 코드를 구현한다
2. 포스트맨으로 테스트한다. https://documenter.getpostman.com/view/15264844/TzCS6RsE


## 주요 구현 부분

### 카드 반환하기

- `CardList`라는 객체에 `해야할 일`, `하고 있는 일`, `완료된 일`에 따라 구분된 리스트들을 담아서 반환.
- `Card` Entity 객체 내에 `status`라는 필드를 주어서 `status`에 따라 카드가 아래 sort()에 의해서 분배되어 해당되는 리스트에 add().

```java
// CardList 클래스

    private void sort(Card card) {
        switch (card.getStatus()) {
            case TODO:
                todo.add(card);
                break;
            case DOING:
                doing.add(card);
                break;
            case DONE:
                done.add(card);
                break;
        }
    }
```

### Log 설계

- Log는 [기획서](https://www.figma.com/proto/vYGeE8xND8ZRkesKHLIc1b/iOS_%ED%88%AC%EB%91%90%EB%A6%AC%EC%8A%A4%ED%8A%B8?node-id=94:445&scaling=contain&page-id=94:414)에 따라서 카드가 생성, 수정, 이동, 삭제가 될 때 히스토리를 나타내기 위한 클래스

- Set으로 로그들을 관리
```java
// Logs 클래스

    @MappedCollection(idColumn = "card_id")
    private Set<Log> logs = new HashSet<>();
```
- 로그 데이터를 부를때 날짜별로 정렬
```java
// CardRepostiory 클래스

    @Query("select * from log ORDER BY create_date_time DESC")
    List<Log> findAllLog();
```

#### Card와 Log의 1대N 관계 VS  Card와 Log를 완전 분리

- Card와 Log를 분리하지않고 Card 마다 Log 를 가지게하여 구현함. SQLSyntaxError를 다음과같은 어노테이션을 외래키를 명시하여 문제 해결
```java
// Logs 클래스

    @MappedCollection(idColumn = "card_id")
    private Set<Log> logs = new HashSet<>();
```
