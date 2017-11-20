package com.hy.gdhoops.web;

import com.hy.gdhoops.properties.Weixin;
import com.hy.gdhoops.weixin.WeiXinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 10:58 2017/11/16
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController{
    @Autowired
    private WeiXinService weiXinService;
    @Autowired
    private Weixin weixin;

    @GetMapping("/toLogin")
    public ModelAndView toLogin() {
        String appid = weixin.getApp_secrect();

        System.out.println(appid);
        return new ModelAndView("toLogin");
    }
    

    @GetMapping("weixinLogin")
    public String weixinLogin() {

        return "redirect:https://open.weixin.qq.com/connect/qrconnect?appid=wxbdc5610cc59c1631&redirect_uri=https%3A%2F%2Fpassport.yhd.com%2Fwechat%2Fcallback.do&response_type=code&scope=snsapi_login&state=3d6be0a4035d839573b04816624a415e#wechat_redirect";
    }
}
