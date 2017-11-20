package com.hy.gdhoops.web;


import com.hy.gdhoops.authorization.annotation.Authorization;
import com.hy.gdhoops.authorization.annotation.CurrentUser;
import com.hy.gdhoops.authorization.manager.TokenManager;
import com.hy.gdhoops.core.Result;
import com.hy.gdhoops.core.ResultCode;
import com.hy.gdhoops.core.ResultGenerator;
import com.hy.gdhoops.model.TokenModel;
import com.hy.gdhoops.model.User;
import com.hy.gdhoops.security.MD5;
import com.hy.gdhoops.service.UserService;
import com.wordnik.swagger.annotations.ApiImplicitParam;
import com.wordnik.swagger.annotations.ApiImplicitParams;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * 获取和删除token的请求地址，在Restful设计中其实就对应着登录和退出登录的资源映射
 */
@RestController
@RequestMapping("/tokens")
public class TokenController {

    @Resource
    private UserService userService;

    @Autowired
    private TokenManager tokenManager;

    @RequestMapping(method = RequestMethod.POST)
    @ApiOperation(value = "登录")
    public Result login(@RequestParam String username, @RequestParam String password) {
        Assert.notNull(username, "username can not be empty");
        Assert.notNull(password, "password can not be empty");

        User user = userService.findBy("username",username);
        String s = MD5.encrypt(password);
        if (user == null ||  //未注册
                !user.getPassword().equals(MD5.encrypt(password))) {  //密码错误
            //提示用户名或密码错误
            return new Result().setCode(ResultCode.UNAUTHORIZED).setMessage("用户名或密码错误");
        }
        //生成一个token，保存用户登录状态
        TokenModel model = tokenManager.createToken(user.getId());
        return ResultGenerator.genSuccessResult(model);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @Authorization
    @ApiOperation(value = "退出登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "authorization", value = "authorization", required = true, dataType = "string", paramType = "header"),
    })
    public Result logout(@CurrentUser User user) {
        tokenManager.deleteToken(user.getId());
        return ResultGenerator.genSuccessResult();
    }

}
