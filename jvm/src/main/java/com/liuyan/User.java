package com.liuyan;

/**
 * @Author: ly
 * @Description:
 * @Date: Created in 9:59 2018/3/14
 */
public class User {
    public int id;
    public String name;

    public User() {
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
