package com.hy.gdhoops.service.impl;

import com.hy.gdhoops.dao.UserMapper;
import com.hy.gdhoops.model.User;
import com.hy.gdhoops.service.UserService;
import com.hy.gdhoops.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2017/11/17.
 */
@Service
@Transactional
public class UserServiceImpl extends AbstractService<User> implements UserService {
    @Resource
    private UserMapper usersMapper;

}
