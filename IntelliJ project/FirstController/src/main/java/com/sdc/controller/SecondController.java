package com.sdc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author aajrhour
 */
@Controller

public class SecondController {
    @RequestMapping(value = "/test")
    public String printWelcome(@RequestParam(value = "myName",required = false) String student,ModelMap model) {
        String name=student;
        model.addAttribute("message", name);
        return "hello";
    }
    @RequestMapping("/tests")
    public String test123(ModelMap model){
        model.addAttribute("message","all users");

        return "hello";
    }


}

