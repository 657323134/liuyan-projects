package com.liuyan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.*;

/**
 * Created by liuyan on 2017/7/30.
 */
@Controller
@RequestMapping({"/","/homepage"})
public class HomeController {
    @RequestMapping(method= GET)
    public String home() {
        return "home";
    }
}
