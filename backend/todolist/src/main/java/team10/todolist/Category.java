package team10.todolist;

public enum Category {
    TODO("todo"),
    PROGRESS("progress"),
    DONE("done");

    private final String smallLetter;

    Category(String smallLetter){
        this.smallLetter = smallLetter;
    }

    public String getSmallLetter(){
        return smallLetter;
    }
}
