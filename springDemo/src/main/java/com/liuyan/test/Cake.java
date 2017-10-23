package com.liuyan.test;

import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by vp on 2017/7/19.
 */
@Component
@Primary
@Scope
public class Cake implements Dessert {
}
