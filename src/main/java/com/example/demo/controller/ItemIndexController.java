package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItemIndexController {

    @RequestMapping(value = "/itemindex", method = RequestMethod.GET)
    public String itemIndex() {
        return "itemindex";
    }
}