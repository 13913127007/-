package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.dto.CompanyUserDTO;
import com.yuantu.dev.business.entity.CompanyUser;
import com.yuantu.dev.business.service.ICompanyUserService;
import com.yuantu.dev.core.web.BaseController;
import com.yuantu.dev.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * CompanyUserController
 *
 * @author 49030
 * @date 2019/8/16
 */
@Api(tags = {"业主"})
@RestController
@RequestMapping("/company_user")
public class CompanyUserController extends BaseController<ICompanyUserService, CompanyUser> {

    @Autowired
    IUserService userService;

    @ApiOperation(value = "新增业主信息")
    @PostMapping("/user")
    public R<Boolean> save(CompanyUserDTO dto) {
        return success(baseService.saveCompanyDto(dto));
    }

    @ApiOperation(value = "更新业主信息")
    @PutMapping("/user/edit")
    public R<Boolean> updateUser(CompanyUserDTO user) {
        return success(baseService.updateByDTOId(user));
    }

    @ApiOperation(value = "分页查询所有业主信息")
    @GetMapping("/page")
    public R<IPage<CompanyUserDTO>> page(CompanyUserDTO user) {
        return success(baseService.queryUser(getPage(), user));
    }

    @ApiOperation(value = "删除业主信息")
    @GetMapping("/delete_{id}")
    public R<Boolean> deleteCompanyUser(@PathVariable("id") Long id) {
        return success(baseService.deleteCompanyUser(id));
    }
}
