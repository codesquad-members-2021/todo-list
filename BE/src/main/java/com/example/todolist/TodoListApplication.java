package com.example.todolist;

import com.example.todolist.config.SimpleJdbcConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class TodoListApplication {

	@Autowired
	public static UserRepository userRepository;

	public static void main(String[] args) {
		SpringApplication.run(TodoListApplication.class, args);
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SimpleJdbcConfig.class);
		UserRepository repo = (UserRepository) ctx.getBean("userRepository");
		User user = new User("naver", "eno");
		User savedUser = repo.save(user);
		System.out.println(savedUser);
		User u1 = repo.findById(1L).get();
		System.out.println(u1);
	}

}
