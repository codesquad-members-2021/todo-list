package team_16.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Log {

    @Id
    private Long id;

    private Action action;//이동 수정 삭제 생성
    private String cardTitle;//카드 제목
    private LocalDateTime time;
    private String previousBoard;//보드 이름
    private String currentBoard;//보드 이름

    public Action getAction() {
        return action;
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public String getPreviousBoard() {
        return previousBoard;
    }

    public String getCurrentBoard() {
        return currentBoard;
    }

    public enum Action {
        ADD, MOVE, REMOVE, UPDATE;
    }

    private Log() {
    }

    private Log(Action action, String cardTitle, String currentBoard) {
        this.action = action;
        this.cardTitle = cardTitle;
        this.time = LocalDateTime.now();
        this.currentBoard = currentBoard;
    }

    private Log(Action action, String cardTitle, String previousBoard, String currentBoard) {
        this.action = action;
        this.cardTitle = cardTitle;
        this.time = LocalDateTime.now();
        this.previousBoard = previousBoard;
        this.currentBoard = currentBoard;
    }

    public static Log newLog(Action action, String cardTitle, String currentBoard) {
        return new Log(action, cardTitle, currentBoard);
    }

    public static Log newLogByPreviousBoard(Action action, String cardTitle, String previousBoard, String currentBoard) {
        return new Log(action, cardTitle, previousBoard, currentBoard);
    }

}
