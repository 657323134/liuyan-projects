package @packageDir.dao;

 /**
 * <p>Title: @objectNameUService</p>
 * <p>Description: @objectNameL Service</p>
 * @author @authorName
 * @version 0.1
 */
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import com.vpfinance.mybatis.annotion.SearchOperator;
import com.vpfinance.mybatis.util.SQLProvider;
import @packageDir.model.@objectNameU;

@Repository
public interface @objectNameUDao extends BaseDao<@objectNameU> {
    /**
     * get all objects
     * @param
     * @return
     */
    @SelectProvider(type = SQLProvider.class, method = "getAll")
    public List<@objectNameU> getAll(@objectNameU @objectNameL, PageBounds row);

    @SelectProvider(type = SQLProvider.class, method = "getAllBy")
    public List<@objectNameU> getAllBy(@objectNameU @objectNameL, Map<String, SearchOperator> options, PageBounds row);

    @SelectProvider(type = SQLProvider.class, method = "get")
    public @objectNameU get(@objectNameU @objectNameL);

    public @objectNameU get@objectNameU(Long id);

    public int existed@objectNameU( @objectNameU @objectNameL);

    public int insert@objectNameU(@objectNameU @objectNameL);

    public int update@objectNameU(@objectNameU @objectNameL);

    public int delete@objectNameU(Long @objectNameLID);

    public List<@objectNameU> query@objectNameUPage(@objectNameU @objectNameL, PageBounds row);

}