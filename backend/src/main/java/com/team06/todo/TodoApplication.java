package com.team06.todo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jdbc.repository.config.EnableJdbcAuditing;

import java.util.TimeZone;
import javax.annotation.PostConstruct;

@SpringBootApplication
@EnableJdbcAuditing
public class TodoApplication {

	@PostConstruct
        void started() {
       	        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
        }

	public static void main(String[] args) {
		SpringApplication.run(TodoApplication.class, args);
	}

}
