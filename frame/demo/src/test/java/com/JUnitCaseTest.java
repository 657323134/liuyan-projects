package com;

import com.vpfinance.model.BAdmin;
import com.vpfinance.service.BAdminService;
import com.vpfinance.util.DateUtil;
import com.vpfinance.util.codec.MD5;
import junit.framework.Assert;
import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.Random;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/** 
* JUnitCaseTest Tester. 
* 
* @author <Authors name> 
* @since <pre>十一月 1, 2017</pre> 
* @version 1.0 
*/
public class JUnitCaseTest {

    Logger logger = Logger.getLogger("TestAccountService");
    BAdminService service = null;

    @Before
    public void init() {

        ApplicationContext aCtx = new FileSystemXmlApplicationContext("classpath:application-dao.xml");
        BAdminService service = (BAdminService) aCtx.getBean("BAdminService");
        assertNotNull(service);

        this.service = service;
    }

    @Test
    public void testInsert() {

        // 创建一个帐户
        BAdmin account = new BAdmin();
        account.setAdminName("selina"+ new Random().nextInt());
        account.setPwd(MD5.encrypt("123456"));
        account.setCreateTime(DateUtil.getCurrentDayStr());

        //将创建的帐户插入到数据库中
        service.addBAdmin(account);
        logger.debug("account id: " + account.getAdminName());

        //从数据库获取刚才插入的帐户
        BAdmin accountFromDb = service.getBAdminByID(account.getId());
        assertNotNull(accountFromDb);
        assertEquals(account.getId(), accountFromDb.getId());
    }

    @Test
    public void testExists(){
        BAdmin account = new BAdmin();
        account.setAdminName("selina123");
        account.setPwd(MD5.encrypt("123456"));
        account.setCreateTime(DateUtil.getCurrentDayStr());
        boolean flag = service.existedBAdmin(account);
        System.out.println("###"+flag);
        Assert.assertEquals(flag,true || false);
    }



    @After
    public void after() throws Exception {

    }

} 
