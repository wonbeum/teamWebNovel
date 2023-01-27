package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan( basePackages = { "com.exmaple.demo", "com.example.controller", "com.example.model" } )
public class TeamNovelApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamNovelApplication.class, args);
	}

}
