package com.vpfinance.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/demo")
public class TestController extends BaseController{

    @RequestMapping(value = "/start")
    public String start() throws Exception {
        return "/list";
    }

}
