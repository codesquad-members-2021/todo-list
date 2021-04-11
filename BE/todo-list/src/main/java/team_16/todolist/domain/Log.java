package team_16.todolist.domain;
import org.springframework.data.annotation.Id;
import java.time.LocalDateTime;

public class Log {

    @Id
    private Long id;

    private String status;
    private String prevBoard;
    private String currBoard;
    private LocalDateTime time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPrevBoard() {
        return prevBoard;
    }

    public void setPrevBoard(String prevBoard) {
        this.prevBoard = prevBoard;
    }

    public String getCurrBoard() {
        return currBoard;
    }

    public void setCurrBoard(String currBoard) {
        this.currBoard = currBoard;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
