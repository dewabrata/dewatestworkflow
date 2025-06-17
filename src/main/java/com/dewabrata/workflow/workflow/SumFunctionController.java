package com.dewabrata.workflow.workflow;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SumFunctionController {

    @GetMapping("/sumfunction")
    public String sumFunction() {
        int a = 5;
        int b = 10;
        int sum = a + b;
        return "The sum of " + a + " and " + b + " is " + sum;
    }
}

