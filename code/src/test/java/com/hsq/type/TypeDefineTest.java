package com.hsq.type;

import com.hsq.sqlparse.DDLParser;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * TypeDefine Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>九月 29, 2017</pre>
 */
public class TypeDefineTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getTypeDefine()map
     */
    @Test
    public void testGetTypeDefine() throws Exception {
        Map<String,String>  map = DDLParser.getTypeDefine();
        Assert.assertEquals(map.getClass().getTypeName(), HashMap.class.getName());
        Assert.assertNotNull(map);
    }

} 
