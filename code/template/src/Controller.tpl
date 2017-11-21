package @packageDir.controller;

 /**
 * <p>Title: @objectNameUService</p>
 * <p>Description: @objectNameL Service</p>
 * @author @authorName
 * @version 0.1
 */

import @packageDir.service.@objectNameUService;
import @packageDir.model.@objectNameU;
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
@RequestMapping(value = "/@objectNameL")
public class @objectNameUController extends BaseController{

    private static Log log = LogFactory.getLog(@objectNameUController.class);


    @Autowired
    private @objectNameUService @objectNameLService;


    @RequestMapping(value = "/@objectNameLAdd")
    public String @objectNameUAdd(){
        return "@resultjspFileDir/@objectNameALadd.jsp";
    }

    @RequestMapping(value = "/@objectNameLAddSave")
    public void @objectNameUAddSave(){

    }

    @RequestMapping(value = "/@objectNameLEdit")
    public String @objectNameUEdit(){
        return "@resultjspFileDir/@objectNameALedit.jsp";
    }

    @RequestMapping(value = "/@objectNameLEditSave")
    public void @objectNameUEditSave(){

    }

    @RequestMapping(value = "/@objectNameLDelete")
    public void @objectNameUDelete(String ids ...){

    }

    @RequestMapping(value = "/@objectNameLShow")
    public void @objectNameUEditShow(){

    }

    @RequestMapping(value = "/@objectNameLSearch")
    public void @objectNameUSearch(){

    }

    @RequestMapping(value = "/@objectNameLList")
    public void @objectNameUList(){

    }

    @RequestMapping(value = "/@objectNameLListPage")
    @ResponseBody
    public List<@objectNameU> @objectNameUListPage(@objectNameU @objectNameL){
        List<@objectNameU> @objectNameLList = @objectNameLService.query@objectNameUPage(@objectNameL,pageBounds);
        return @objectNameLList;
    }
}