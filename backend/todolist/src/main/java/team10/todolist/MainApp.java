package team10.todolist;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import team10.todolist.domain.Card;
import team10.todolist.repository.CardRepository;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringConfig.class);
        CardRepository repo = (CardRepository) ctx.getBean("cardRepository");
        Card board = new Card();
        board.author = "Hoyoung Jung";
        Card savedUser = repo.save(board);
        System.out.println(savedUser);
        Card u1 = repo.findById(1L).get();
        System.out.println(u1);
    }
}
