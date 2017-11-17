package com.hy.gdhoops.cachebiz;

import java.util.Set;

/**
 * Created by kuros on 2017/3/13.
 */
public class GoUrlConfig {

    private static Set goUrlSet;

    public static Set getGoUrlSet() {
        return goUrlSet;
    }

    public static void setGoUrlSet(Set goUrlSet) {
        GoUrlConfig.goUrlSet = goUrlSet;
    }
}
