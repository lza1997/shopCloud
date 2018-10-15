package com.example.mycenter;

        import org.springframework.boot.SpringApplication;
        import org.springframework.boot.autoconfigure.SpringBootApplication;
        import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class MycenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(MycenterApplication.class, args);
    }
}
