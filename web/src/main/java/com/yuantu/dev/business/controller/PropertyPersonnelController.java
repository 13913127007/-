package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.entity.PropertyPersonnel;
import com.yuantu.dev.business.service.IPropertyPersonnelService;
import com.yuantu.dev.business.vo.PropertyPersonnelSelectedVO;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/propersonnel")
public class PropertyPersonnelController extends BaseController<IPropertyPersonnelService, PropertyPersonnel> {

    @GetMapping("/page")
    public R<IPage<PropertyPersonnel>> page(PropertyPersonnel propertyPersonnel) {
        R<IPage<PropertyPersonnel>> success = success(baseService.queryUser(getPage(), propertyPersonnel));
        return success;
    }

    @PostMapping("/saveProperson")
    public R<Boolean> saveCompany(PropertyPersonnel dto) {
        return success(baseService.save(dto))
                ;
    }


    @ApiOperation(value = "修改物业人员信息")
    @PutMapping("/edit")
    public R<Boolean> editCompany(PropertyPersonnel propertyPersonnel) {
        System.out.println(baseService.editProPerson(propertyPersonnel));

        return success(baseService.editProPerson(propertyPersonnel));
    }

    @Override
    @DeleteMapping("/del/{id}")
    public R<Boolean> remove(@PathVariable("id") Long id) {
        return super.remove(id);
    }


    @ApiOperation(value = "根据 用户id 查询其所属角色")
    @GetMapping("/list_{propertyId}")
    public R<List<PropertyPersonnelSelectedVO>> listSelected(@PathVariable("propertyId") Long propertyId) {
        return success(baseService.listSelectedVO(propertyId));
    }
}
