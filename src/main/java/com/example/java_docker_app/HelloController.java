package com.example.java_docker_app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello () {
        return "Hello from java app running inside Docker!";
    }
}
