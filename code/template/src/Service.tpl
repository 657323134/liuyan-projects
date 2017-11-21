package @packageDir.service;

 /**
 * <p>Title: @objectNameUService</p>
 * <p>Description: @objectNameL Service</p>
 * @author @authorName
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
import @packageDir.dao.@objectNameUDao;
import @packageDir.model.@objectNameU;

@Service
public class @objectNameUService {

  private static Log log = LogFactory.getLog(@objectNameUService.class);

  @Autowired
  private @objectNameUDao dao;

  /**
   * 判断是否已经存在相同记录
   * @param  @objectNameL 记录的值对象
   * @return 是否存在另一记录与该记录相同
   */
  public boolean existed@objectNameU( @objectNameU @objectNameL  ) {

    int resultTotal = 0;
    try {
        resultTotal = dao.existed@objectNameU(@objectNameL);
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return resultTotal>0?true:false;
  }


  /**
   * add a new record
   * @param @objectNameL 新增记录的值对象
   * @return 是否添加成功
   */
  public boolean add@objectNameU( @objectNameU @objectNameL ){
    int result = dao.insert@objectNameU(@objectNameL);
    return result>0?true:false;
  }

  /**
   * edit the specified object
   * @param @objectNameL 修改成的新记录的对象
   * @return 修改是否成功
   */
  public boolean edit@objectNameU( @objectNameU @objectNameL){  
    int result = dao.update@objectNameU(@objectNameL);
    return result>0?true:false;
  }

  /**
   * delete the specified object by id
   * @param @objectNameLID 记录的ID值
   * @return 删除记录是否成功
   */
  private boolean del@objectNameUById(Long @objectNameLID) {
    int result =  dao.delete@objectNameU(@objectNameLID);
    return result>0?true:false;
  }

  /**
   * delete the specified objects
   * @param @objectNameLIDs 多条记录ID组成的数组
   * @return boolean 删除多条是否成功
   */
  public boolean del@objectNameUs(String[] @objectNameLIDs) {
    if ( @objectNameLIDs != null && @objectNameLIDs.length > 0 ) {
      int size = @objectNameLIDs.length;
      for (int i = 0; i < size; i++) {
        if ( !this.del@objectNameUById( Long.parseLong(@objectNameLIDs[i]))) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  /**
   * get the specified object
   * @param @pObjectNameL 记录的ID值
   * @return 与该ID匹配的记录的值对象
   */
  public @objectNameU get@objectNameUByID(Long @pObjectNameL ){
    return dao.get@objectNameU(@pObjectNameL);
  }

    /**
    * get the specified object
    * @param @pObjectNameL 记录的ID值
    * @return 与该ID匹配的记录的值对象
    */
    public @objectNameU get@objectNameUByID(@pObjectNameU @pbjectNameL ){
        return dao.get@objectNameU(@ObjectNameL);
    }

  /**
   * get all objects
   * @param
   * @return 全部记录的列表
   */
  public List<@objectNameU> get@objectNameUList(@objectNameU @objectNameL, PageBounds row){
    return dao.getAll(@objectNameL,row);
  }

    /**
    * get all objects
    * @param
    * @return 全部记录的列表
    */
    public List<@objectNameU> get@objectNameUListBySearch(@objectNameU @objectNameL, PageBounds row){
        return dao.getAll(@objectNameL,row);
    }

  /**
   * 查询结果分页显示
   * @param pageBean 页信息的对象
   * @return 是否分页查询成功
   */
  public List<@objectNameU> query@objectNameUPage(@objectNameU @objectNameL, PageBounds pageBounds ){
    return dao.query@objectNameUPage(@objectNameL,pageBounds);
  }

    /**
    * 查询结果分页显示
    * @param pageBean 页信息的对象
    * @return 是否分页查询成功
    */
    public List<@objectNameU> query@objectNameUPageBySearch(@objectNameU @objectNameL, PageBounds pageBounds ){
        return dao.query@objectNameUPage(@objectNameL,pageBounds);
    }

}