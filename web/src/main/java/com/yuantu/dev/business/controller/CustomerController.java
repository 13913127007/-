package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.dto.CustomerDTO;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.common.utils.Pinyin4jUtils;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

import static org.springframework.boot.actuate.autoconfigure.cloudfoundry.SecurityResponse.success;

@RestController
@RequestMapping("/cus/customer")
public class CustomerController extends BaseController<ICustomerService, CompanyCustomer> {

    @Resource
    private ICustomerService customerService;

    /*@GetMapping("/page/{id}")
    public R<IPage<CompanyCustomer>> page(@PathVariable("id") Long id) {
        R<IPage<CompanyCustomer>> success = success(baseService.queryUser(getPage(), id));
        return  success;
    }*/
/*    @ApiOperation(
            value = "查询 用户名username 存在与否",
            notes = "新增时，id默认0，返回存在数量；更新时，id为用户id，返回除更新用户以外的数量"
    )
    @GetMapping("/verify/{id}/{userName}")
    public R<Integer> userNameNotUnique(@PathVariable("id") Long id, @PathVariable("userName") String userName){
        return success(baseService.userNameCount(id,userName));
    }*/
    @ApiOperation(value = "新增用户")
    @PostMapping("/dto")
    public R<Boolean> save(CustomerDTO customer) {

        return success(customerService.saveDto(customer));
    }

/*    @ApiOperation(value = "更新用户")
    @PutMapping("/dto/edit")
    public R<Boolean> edit(CompanyCustomer customer) {
        return success(baseService.updateById(customer));
    }*/
/*
    @Override
    @DeleteMapping("/{id}")
    public R<Boolean> remove(@PathVariable("id") Long id) {
        return super.remove(id);
    }*/

}
