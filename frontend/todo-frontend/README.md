- column 의 타입들 어떻게 나누지

Map <Key, Value>

"column1_card1"
"column1_card2"
"column1_card4"

"column2_card3": value
"column2_card5":

"column2_card2" -> key

{ CardObject } -> Value

Map.

```json
{
    author : 'kyle'
    todoColumn:[
        {
            id: "column0",
            title:'해야할 일',
            todoCards:[
                {
                    id,
                    title,
                    content,
                    author,
                    description
                },
            ]
        },
        {
            id:1,
            title:'하고 있는 일',
            todoCards:[
                {
                    id: "column1card3",
                    title,
                    content,
                    description,
                    realDate:
                    primary:0
                },
                {
                    id: "column1card2",
                    title,
                    content,
                    author,
                    description
                },
            ]
        }
    ]
}
```

이동을 한다! : 기존 아이템을 옮긴거랑 id 같아야 한다?
기존 아이템을 삭제해버리고, 새로운 아이템을 만든거다, 동일한 내용의
