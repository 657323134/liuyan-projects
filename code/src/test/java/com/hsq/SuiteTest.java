package com.hsq;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;


@RunWith(Suite.class)
@Suite.SuiteClasses({
    com.hsq.lib.ConvertStringTest.class,
    com.hsq.type.TypeDefineTest.class,
    com.hsq.sqlparse.FieldTest.class
})
public class SuiteTest{

}