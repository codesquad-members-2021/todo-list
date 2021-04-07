package com.codeSquad.cocokyu;

import com.codeSquad.cocokyu.domain.SimpleJdbcConfig;
import com.codeSquad.cocokyu.domain.CardRepository;
import com.codeSquad.cocokyu.domain.Card;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class CocoKyuApplication {

	public static void main(String[] args) {
		SpringApplication.run(CocoKyuApplication.class, args);
	}


}
