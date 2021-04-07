package team10.todolist;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import team10.todolist.domain.Board;
import team10.todolist.repository.BoardRepository;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SimpleJdbcConfig.class);
        BoardRepository repo = (BoardRepository) ctx.getBean("boardRepository");
        Board board = new Board();
        board.author = "Hoyoung Jung";
        Board savedUser = repo.save(board);
        System.out.println(savedUser);
        Board u1 = repo.findById(1L).get();
        System.out.println(u1);
    }
}
