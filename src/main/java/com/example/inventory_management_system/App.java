package com.example.inventory_management_system;
import com.example.inventory_management_system.repository.ItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class App {

	@Autowired
	private ItemDao itemDao;


	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}

	@Bean
	CommandLineRunner commandLineRunner() {
		return args -> {
			// Preload your any additional data here...
		};
	}



}
