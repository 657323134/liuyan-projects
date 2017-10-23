package com.springboot.ch1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class SpringbootdemoApplication {

//    @Value("${book.name}")
//    private String name;
//
//    @Value("${book.price}")
//    private int price;

    @Autowired
    private Author author;

    @RequestMapping
    public String index() {

        return "hello spring boot";
    }

    public static void main(String[] args) {

        SpringApplication app = new SpringApplication(SpringbootdemoApplication.class);
        app.setBannerMode(Banner.Mode.OFF);
        app.run(args);
    }
}
