package com.liuyan.controller;

import com.liuyan.dto.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by liuyan on 2017/7/21.
 */
@Controller
@RequestMapping(value="/test")
public class TestController {

    @RequestMapping("test")
    @ResponseBody
    public Student test () {
        return new Student("asdsad","125");
    }
}
