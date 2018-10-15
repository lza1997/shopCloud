package com.lza.mygateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
public class MygatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(MygatewayApplication.class, args);
    }
}
