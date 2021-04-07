# ToDo-List 
그룹프로젝트 #1

## 우리는 ESFJ 이에요!

`E`lly `S`ally `F`reddie `J`ackson 로 이루어진 **친선도모형** 사교적인 외교관입니다.



### 팀원

|                 💻 `Back-End`                 |                     📱`IOS`                     |
| :------------------------------------------: | :------------------------------------------: |
|  [새리](https://github.com/min27604) 👩🏻‍💻  | [엘리](https://github.com/ellyheetov) 👩🏻‍💻 |
| [프레디](https://github.com/Dae-Hwa) 🧑🏻‍💻 | [잭슨](https://github.com/JacksonPK) 🧑🏻‍💻 |



2주동안 파이아🔥🔥🔥





## IOS 04.06 Mon (1일 차)



#### 구현 및 학습 정리 📚

- `Inframance` = 사소하다고 생각하는 모든 것들을 다시 보기.

- `UI` 에 초점을 맞추었고, `StoryBoard` 를 통해 백그라운드바(`View`), 타이틀(`Label`), 메뉴버튼(`Button`)을 만들었다.

- 커스텀 폰트를 적용하였다. `Noto Sans KR` 

- `Auto Layout`의 일부분이지만 많은 삽질을 통해 `Safe View`에 대해 다시한번 파악하였다. 

  - IPad 11inch 2nd 기준 bottom height 20을 뺌

  - 이 botton에 20Height은 Swipe-Up 을 위한 공간이다.

    

<img src = "https://user-images.githubusercontent.com/52390975/113719274-67269580-9728-11eb-9efb-3c9b1a08af64.png" >





## IOS 04.07 Mon (2일 차)



#### 구현 및 학습 정리 📚

- 총 3개의 `TableView`를 어떻게 설계할지에 대한 토의를 하였다. (2가지 방법)

  - 1. 세 개의 View 안에 각각 Table View를 넣어서 총 3가지의 UIView를 만들기
    2. 한 개의 View 안에 3개의 Table View를 넣어서 한 개의 View가 Table View를 관리하기 **(채택)**
  -  2번을 채택한 이유 : To do/Doing/Done에 해당하는 각 테이블 뷰의 카드를 관리하기 용이할 것으로 판단하였다. (특히 카드를 이동할 때)

- `TaskViewController`를 제작하고 해당 View에 필요한 3개의 `TableView`와 필요한 Label, Button을 추가하였다. (`StoryBoard` 작업)

  - `Label`(해야할일/하고있는일/완료한일), `Label`(해당 테이블 카드의 총 수), `Button`(해당 테이블에 추가할 수 있는 버튼)

- TableView에 들어갈 TableViewCell을 제작하였고 필요한 Title/Content/Writer를 임시로 지정하여 저장하였다. (`Xib` 작업)

- register를 이용하여 TableView에 제작하였으며 switch 구문을 이용하여서 각 Table의 카드 수를 변동하여 테스트 하였다.

  - ```swift
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
            switch tableView {
            case todo:
                return 3
            case doing:
                return 4
            case done:
                return 1
            default:
                return 0
            }        
        }
    ```

  ![Simulator Screen Shot - iPad Pro (11-inch) (2nd generation) - 2021-04-07 at 23 26 22](https://user-images.githubusercontent.com/52390975/113884598-0f585f00-97fa-11eb-9373-62ae0c1a81af.png)