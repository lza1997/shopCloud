package com.lza.mymonitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableAdminServer

public class MyMonitorApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyMonitorApplication.class, args);
    }
}
