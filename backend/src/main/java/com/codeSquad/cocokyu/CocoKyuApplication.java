package com.codeSquad.cocokyu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class CocoKyuApplication {

	public static void main(String[] args) {
		SpringApplication.run(CocoKyuApplication.class, args);
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SimpleJdbcConfig.class);
		TodoRepository repo = (TodoRepository) ctx.getBean("todoRepository");
		Todo todo = new Todo("sample","sampleContents","open");
		Todo savedTodo = repo.save(todo);
		System.out.println(savedTodo);
		Todo u1 = repo.findById(1L).get();
		System.out.println(u1);
	}


}
