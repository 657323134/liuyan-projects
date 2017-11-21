package com.hsq.cg;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * ReadFile Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>九月 29, 2017</pre>
 */
public class ReadFileTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getFileContent(String srcFile)
     */
    @Test
    public void testGetFileContent() throws Exception {
        Integer c1 = 1;
        Integer c2 = 2;
        assertEquals(3, c1+c2);
    }


} 
