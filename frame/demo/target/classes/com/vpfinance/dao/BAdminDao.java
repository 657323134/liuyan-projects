package com.vpfinance.dao;

 /**
 * <p>Title: BAdminService</p>
 * <p>Description: bAdmin Service</p>
 * @author HuangShaoQing
 * @version 0.1
 */
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import com.vpfinance.model.BAdminSearch;
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

    public BAdmin getBAdminById(@Param("id")Long bAdminID);

    public int existedBAdmin(BAdmin bAdmin);

    public int deleteBAdminById(@Param("id")Long bAdminID);

    public List<BAdmin> getBAdminList(BAdmin bAdmin);

    public List<BAdmin> getBAdminListPage(BAdmin bAdmin,  PageBounds row);

    public List<BAdmin> getBAdminListPage(BAdminSearch search,  PageBounds row);

    public List<BAdmin> getBAdminSearchList(BAdmin bAdmin);

    public List<BAdmin> queryBAdminSearchListPage(BAdmin bAdmin, BAdminSearch search, PageBounds row);

}
