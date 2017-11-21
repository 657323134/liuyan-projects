package com.vpfinance.service;

 /**
 * <p>Title: BAdminService</p>
 * <p>Description: bAdmin Service</p>
 * @author HuangShaoQing
 * @version 0.1
 */
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.vpfinance.dao.BAdminDao;
import com.vpfinance.model.BAdmin;

@Service
public class BAdminService {

  private static Log log = LogFactory.getLog(BAdminService.class);

  @Autowired
  private BAdminDao dao;

  /**
   * 判断是否已经存在相同记录
   * @param  bAdmin 记录的值对象
   * @return 是否存在另一记录与该记录相同
   */
  public boolean existedBAdmin( BAdmin bAdmin  ) {

    int resultTotal = 0;
    try {
        resultTotal = dao.existedBAdmin(bAdmin);
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return resultTotal>0?true:false;
  }


  /**
   * add a new record
   * @param bAdmin 新增记录的值对象
   * @return 是否添加成功
   */
  public boolean addBAdmin( BAdmin bAdmin ){
    int result = dao.insertBAdmin(bAdmin);
    return result>0?true:false;
  }

  /**
   * edit the specified object
   * @param bAdmin 修改成的新记录的对象
   * @return 修改是否成功
   */
  public boolean editBAdmin( BAdmin bAdmin){  
    int result = dao.updateBAdmin(bAdmin);
    return result>0?true:false;
  }

  /**
   * delete the specified object by id
   * @param bAdminID 记录的ID值
   * @return 删除记录是否成功
   */
  private boolean delBAdminById(Long bAdminID) {
    int result =  dao.deleteBAdmin(bAdminID);
    return result>0?true:false;
  }

  /**
   * delete the specified objects
   * @param bAdminIDs 多条记录ID组成的数组
   * @return boolean 删除多条是否成功
   */
  public boolean delBAdmins(String[] bAdminIDs) {
    if ( bAdminIDs != null && bAdminIDs.length > 0 ) {
      int size = bAdminIDs.length;
      for (int i = 0; i < size; i++) {
        if ( !this.delBAdminById( Long.parseLong(bAdminIDs[i]))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  /**
   * get the specified object
   * @param id 记录的ID值
   * @return 与该ID匹配的记录的值对象
   */
  public BAdmin getBAdminByID(Long id ){
    return dao.getBAdmin(id);
  }

    /**
    * get the specified object
    * @param id 记录的ID值
    * @return 与该ID匹配的记录的值对象
    */
    public BAdmin getBAdminByID(Id @pbjectNameL ){
        return dao.getBAdmin(@ObjectNameL);
    }

  /**
   * get all objects
   * @param
   * @return 全部记录的列表
   */
  public List<BAdmin> getBAdminList(BAdmin bAdmin, PageBounds row){
    return dao.getAll(bAdmin,row);
  }

    /**
    * get all objects
    * @param
    * @return 全部记录的列表
    */
    public List<BAdmin> getBAdminListBySearch(BAdmin bAdmin, PageBounds row){
        return dao.getAll(bAdmin,row);
    }

  /**
   * 查询结果分页显示
   * @param pageBean 页信息的对象
   * @return 是否分页查询成功
   */
  public List<BAdmin> queryBAdminPage(BAdmin bAdmin, PageBounds pageBounds ){
    return dao.queryBAdminPage(bAdmin,pageBounds);
  }

    /**
    * 查询结果分页显示
    * @param pageBean 页信息的对象
    * @return 是否分页查询成功
    */
    public List<BAdmin> queryBAdminPageBySearch(BAdmin bAdmin, PageBounds pageBounds ){
        return dao.queryBAdminPage(bAdmin,pageBounds);
    }

}

