package com.vpfinance.web;

/**
 * <p>Title: BAdminService</p>
 * <p>Description: bAdmin Service</p>
 *
 * @author HuangShaoQing
 * @version 0.1
 */

import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.vpfinance.model.BAdmin;
import com.vpfinance.model.BAdminSearch;
import com.vpfinance.service.BAdminService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/bAdmin")
public class BAdminController extends BaseController {

    private static Log log = LogFactory.getLog(BAdminController.class);


    @Autowired
    private BAdminService bAdminService;


    @RequestMapping(value = "/bAdminAdd")
    public String BAdminAdd() {
        return "badmin/badminadd_new";
    }

    @RequestMapping(value = "/bAdminAddSave")
    @ResponseBody
    public Map<String,Object> BAdminAddSave(HttpServletRequest request,BAdmin bAdmin) {
        boolean result = bAdminService.addBAdmin(bAdmin);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", result?0:-1);
        map.put("count",0);
        map.put("data", null);
        return map;
    }

    @RequestMapping(value = "/bAdminEdit")
    public String BAdminEdit() {
        Long bAdminId = 14L;
        BAdmin bAdmin = bAdminService.getBAdminByID(bAdminId);
        request.setAttribute("bAdmin", bAdmin);
        return "badmin/badminedit_new";
    }

    @RequestMapping(value = "/bAdminEditSave")
    public  Map<String,Object> BAdminEditSave(HttpServletRequest request,BAdmin bAdmin) {
        boolean result = bAdminService.editBAdmin(bAdmin);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", result?0:-1);
        map.put("count",0);
        map.put("data", null);
        return map;
    }

    @RequestMapping(value = "/bAdminList")
    public String BAdminList() {
        return "badmin/list";
    }

    @RequestMapping(value = "/bAdminListPage")
    @ResponseBody
    public Map BAdminListPage(BAdmin bAdmin, int page, int limit) {
        pageBounds.setPage(page);
        pageBounds.setLimit(limit);

        PageList bAdminList = (PageList) bAdminService.getBAdminListPage(bAdmin, pageBounds);
        return responseResult(bAdminList);
    }

    @RequestMapping(value = "/bAdminSearchListPage")
    @ResponseBody
    public Map BAdminSearchListPage(BAdmin bAdmin, BAdminSearch search, int page, int limit) {
        pageBounds.setPage(page);
        pageBounds.setLimit(limit);

        PageList bAdminList = (PageList) bAdminService.queryBAdminSearchListPage(bAdmin,search, pageBounds);
        return responseResult(bAdminList);
    }

    @RequestMapping(value = "/bAdminShow")
    public String BAdminEditShow(Long id) {
        BAdmin bAdmin = bAdminService.getBAdminByID(id);
        request.setAttribute("bAdmin", bAdmin);
        return "badmin/show";
    }

    @RequestMapping(value = "/bAdminDelete")
    public String bAdminDelete(String ... id ) {
        boolean delFlag = bAdminService.delBAdmins(id);
        request.setAttribute("flag", delFlag);
        return "badmin/show";
    }

    @RequestMapping(value = "/bAdminSearch")
    public String BAdminSearch() {
        return "badmin/badminsearch_new";
    }

    @RequestMapping(value = "/test")
    public String BAdminTest() {
        return "badmin/list";
    }
}