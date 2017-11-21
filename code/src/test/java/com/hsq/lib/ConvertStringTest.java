package com.hsq.lib;

import com.hsq.lib.ConvertString;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * ConvertString Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>九月 29, 2017</pre>
 */
public class ConvertStringTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: omitBlank(String srcStr)
     */
    @Test
    public void testOmitBlank() throws Exception {
        String str = "One of the two will be used. Which one is undefined.";
        Assert.assertEquals(str.replaceAll(" ",""),ConvertString.omitBlank(str));
    }

    /**
     * Method: changeFirstChar(String srcStr, String flag)
     */
    @Test
    public void testChangeFirstChar() throws Exception {
        String word = "hello";

        String charCase1 = "U";
        String cWord1 = ConvertString.changeFirstChar(word,charCase1);
        Assert.assertEquals("Hello",cWord1);

        String charCase2 = "L";
        word = "Hello";
        String cWord2 = ConvertString.changeFirstChar(word,charCase2);
        Assert.assertEquals("hello",cWord2);
    }

} 
