package com.example.todolist;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class TodoListApplication {
    private static final Logger logger = LoggerFactory.getLogger(TodoListApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(TodoListApplication.class, args);
        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        CardRepository cardRepository = (CardRepository) context.getBean("cardRepository");
        Card card = new Card("todo1", "todo-content", "to-do");
        cardRepository.save(card);
        Card card1 = cardRepository.findById(1L).get();
        logger.info(card1.toString());
        System.out.println(card1);
    }

}
