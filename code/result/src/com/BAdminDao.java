package com.vpfinance.dao;

 /**
 * <p>Title: BAdminService</p>
 * <p>Description: bAdmin Service</p>
 * @author HuangShaoQing
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
import com.vpfinance.model.BAdmin;

@Repository
public interface BAdminDao extends BaseDao<BAdmin> {
    /**
     * get all objects
     * @param
     * @return
     */
    @SelectProvider(type = SQLProvider.class, method = "getAll")
    public List<BAdmin> getAll(BAdmin bAdmin, PageBounds row);

    @SelectProvider(type = SQLProvider.class, method = "getAllBy")
    public List<BAdmin> getAllBy(BAdmin bAdmin, Map<String, SearchOperator> options, PageBounds row);

    @SelectProvider(type = SQLProvider.class, method = "get")
    public BAdmin get(BAdmin bAdmin);

    public BAdmin getBAdmin(Long id);

    public int existedBAdmin( BAdmin bAdmin);

    public int insertBAdmin(BAdmin bAdmin);

    public int updateBAdmin(BAdmin bAdmin);

    public int deleteBAdmin(Long bAdminID);

    public List<BAdmin> queryBAdminPage(BAdmin bAdmin, PageBounds row);

}

