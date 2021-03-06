package com.hy.gdhoops.web;

import com.hy.gdhoops.authorization.annotation.Authorization;
import com.hy.gdhoops.authorization.annotation.CurrentUser;
import com.hy.gdhoops.core.Result;
import com.hy.gdhoops.core.ResultGenerator;
import com.hy.gdhoops.model.User;
import com.hy.gdhoops.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wordnik.swagger.annotations.ApiImplicitParam;
import com.wordnik.swagger.annotations.ApiImplicitParams;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2017/11/20.
*/
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @PostMapping
    public Result add(@RequestBody User user) {
        userService.save(user);
        return ResultGenerator.genSuccessResult();
    }

//    @DeleteMapping("/{id}")
//    public Result delete(@PathVariable Integer id) {
//        userService.deleteById(id);
//        return ResultGenerator.genSuccessResult();
//    }

    @PutMapping
    public Result update(@RequestBody User user) {
        userService.update(user);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/detail")
    @Authorization
    @ApiOperation(value = "用户信息详情")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header"),
    })
    public Result detail(@CurrentUser User user) {
        return ResultGenerator.genSuccessResult(user);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<User> list = userService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
