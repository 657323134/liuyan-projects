package com.vpfinance.controller;

 /**
 * <p>Title: BAdminService</p>
 * <p>Description: bAdmin Service</p>
 * @author HuangShaoQing
 * @version 0.1
 */

import com.vpfinance.service.BAdminService;
import com.vpfinance.model.BAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Controller
@RequestMapping(value = "/bAdmin")
public class BAdminController extends BaseController{

    private static Log log = LogFactory.getLog(BAdminController.class);


    @Autowired
    private BAdminService bAdminService;


    @RequestMapping(value = "/bAdminAdd")
    public String BAdminAdd(){
        return "/badmin/badminadd.jsp";
    }

    @RequestMapping(value = "/bAdminAddSave")
    public void BAdminAddSave(){

    }

    @RequestMapping(value = "/bAdminEdit")
    public String BAdminEdit(){
        return "/badmin/badminedit.jsp";
    }

    @RequestMapping(value = "/bAdminEditSave")
    public void BAdminEditSave(){

    }

    @RequestMapping(value = "/bAdminDelete")
    public void BAdminDelete(String ids ...){

    }

    @RequestMapping(value = "/bAdminShow")
    public void BAdminEditShow(){

    }

    @RequestMapping(value = "/bAdminSearch")
    public void BAdminSearch(){

    }

    @RequestMapping(value = "/bAdminList")
    public void BAdminList(){

    }

    @RequestMapping(value = "/bAdminListPage")
    @ResponseBody
    public List<BAdmin> BAdminListPage(BAdmin bAdmin){
        List<BAdmin> bAdminList = bAdminService.queryBAdminPage(bAdmin,pageBounds);
        return bAdminList;
    }
}

