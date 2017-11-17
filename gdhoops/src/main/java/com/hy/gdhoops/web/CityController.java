package com.hy.gdhoops.web;

import com.hy.gdhoops.core.Result;
import com.hy.gdhoops.core.ResultGenerator;
import com.hy.gdhoops.model.City;
import com.hy.gdhoops.service.CityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2017/11/14.
*/
@RestController
@RequestMapping("/city")
public class CityController {
    @Resource
    private CityService cityService;

    @PostMapping
    public Result add(@RequestBody City city) {
        cityService.save(city);
        return ResultGenerator.genSuccessResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        cityService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PutMapping
    public Result update(@RequestBody City city) {
        cityService.update(city);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Integer id) {
        City city = cityService.findById(id);
        return ResultGenerator.genSuccessResult(city);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<City> list = cityService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
