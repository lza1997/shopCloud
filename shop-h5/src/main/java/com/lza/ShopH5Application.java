package com.lza;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
@MapperScan("com.lza.dao")
public class ShopH5Application {

    public static void main(String[] args) {
        SpringApplication.run(ShopH5Application.class, args);
    }
}
