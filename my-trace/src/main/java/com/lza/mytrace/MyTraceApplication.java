package com.lza.mytrace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import zipkin.server.EnableZipkinServer;

@SpringBootApplication
@EnableZipkinServer
public class MyTraceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyTraceApplication.class, args);
    }
}
