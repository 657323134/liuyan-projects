package com.hy.gdhoops.service.impl;

import com.hy.gdhoops.dao.CityMapper;
import com.hy.gdhoops.model.City;
import com.hy.gdhoops.service.CityService;
import com.hy.gdhoops.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2017/11/14.
 */
@Service
@Transactional
public class CityServiceImpl extends AbstractService<City> implements CityService {
    @Resource
    private CityMapper cityMapper;

}
