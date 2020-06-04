package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;

import com.yuantu.dev.business.entity.Company;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.service.ICompanyInfoService;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.common.utils.KeyUtil;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * CompanyInfoController
 * <p>
 * 公司信息表 实现服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */
@Api(tags = "企业信息")
@RestController
@RequestMapping("/company")
public class CompanyInfoController extends BaseController<ICompanyInfoService, Company> {

    @Resource
    private ICustomerService customerService;

    @ApiOperation(value = "分页查询")
    @GetMapping("/page")
    public R<IPage<Company>> page(Company companyInfo) {

        R<IPage<Company>> success = success(baseService.companyPage(getPage(), companyInfo));

        return success;
    }

    @ApiOperation(value = "新增企业信息")
    @PostMapping("/saveCompany")
    public R<Boolean> saveCompany(Company dto) {

        return success(baseService.saveCompany(dto));
    }
    /*@ApiOperation(value = "删除企业相关信息")
    @PutMapping("/delete_{{id}}")
    public R<Boolean> deleteCompany(CompanyInfoDTO dto){return success(baseService.deleteCompany(dto));}*/


    @ApiOperation(value = "修改企业信息")
    @PutMapping("/edit")
    public R<Boolean> editCompany(Company companyInfo) {
        System.out.println(baseService.editCompany(companyInfo));

        return success(baseService.editCompany(companyInfo));
    }

    @GetMapping("/list_{id}")
    public R<IPage<CompanyCustomer>> page(@PathVariable("id") Long id) {

        R<IPage<CompanyCustomer>> success = success(customerService.chaCustomer(getPage(), id));
        return success;
    }

    @Override
    @DeleteMapping("/delete_{id}")
    public R<Boolean> remove(@PathVariable("id") Long id) {
        return success(baseService.deleteCompany(id));
    }
}
