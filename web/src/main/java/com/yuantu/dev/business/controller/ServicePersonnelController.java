package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.dto.CompanyDTO;
import com.yuantu.dev.business.entity.PropertyPersonnel;
import com.yuantu.dev.business.entity.ServicePersonnel;
import com.yuantu.dev.business.service.IPropertyPersonnelService;
import com.yuantu.dev.business.service.IServicePersonnelService;
import com.yuantu.dev.business.vo.PropertyPersonnelSelectedVO;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/serperson")
public class ServicePersonnelController extends BaseController<IServicePersonnelService, ServicePersonnel> {

    @GetMapping("/page")
    public R<IPage<ServicePersonnel>> page(ServicePersonnel servicePersonnel) {
        R<IPage<ServicePersonnel>> success = success(baseService.queryUser(getPage(), servicePersonnel));
        return success;
    }

    @PostMapping("/saveSerperson")
    public R<Boolean> saveCompany(ServicePersonnel dto) {

        return success(baseService.save(dto));
    }

    @ApiOperation(value = "修改服务人员信息")
    @PutMapping("/edit")
    public R<Boolean> editCompany(ServicePersonnel servicePersonnel) {
        System.out.println(baseService.editSerPerson(servicePersonnel));

        return success(baseService.editSerPerson(servicePersonnel));
    }

    @Override
    @DeleteMapping("/del/{id}")
    public R<Boolean> remove(@PathVariable("id") Long id) {
        return super.remove(id);
    }
   /* @ApiOperation(value = "根据 用户id 查询其所属角色")
    @GetMapping("/list_{propertyId}")
    public R<List<PropertyPersonnelSelectedVO>> listSelected(@PathVariable("propertyId") Long propertyId) {
        return success(baseService.listSelectedVO(propertyId));
    }*/
}
