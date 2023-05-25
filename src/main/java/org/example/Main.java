package org.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class },scanBasePackages = {"org.example"})
@EnableJpaRepositories
@EnableAutoConfiguration
public class Main {
    public static void main(String[] args)  {
        ConfigurableApplicationContext context = SpringApplication.run(Main.class,args);
    }
}