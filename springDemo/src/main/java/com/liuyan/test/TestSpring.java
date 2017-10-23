package com.liuyan.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by vp on 2017/7/18.
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes=JavaConfig.class)
public class TestSpring {
//    @Autowired(required = false)
//    private TestService testService;
//    @Autowired
//    private CalcService calcService;

    @Autowired
    private Environment environment;
    @Test
    public void test() {
//        System.out.println(testService.aa());
//        System.out.println(calcService.calc());
//        String timeStr = "2017071947605896";
//        String time = timeStr.substring(8);
//        time = DateUtil.formatHHMMSS(time);
//        String date = timeStr.substring(0, 8);
//        Date signDate = DateUtil.formatyyyyMMddHHmmss(date+time);
////        signInfoDto.setSignDate(signDate);
//        System.out.println(signDate);

        String title = environment.getProperty("disc.title");
        System.out.println(title);

        String artist = environment.getProperty("disc.artist");
        System.out.println(artist);
        Integer conn = environment.getProperty("disc.conn", Integer.class, 30);
        System.out.println(conn);
    }
}
