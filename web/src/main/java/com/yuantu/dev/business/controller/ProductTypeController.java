package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.entity.ProductType;
import com.yuantu.dev.business.service.IProductTypeService;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ProductTypeController
 * <p>
 * 产品类型表前端控制器
 * </p>
 *
 * @author 49030
 * @date 2019/8/12
 */
@Api(tags = {"产品类型"})
@RestController
@RequestMapping("/productType")
public class ProductTypeController extends BaseController<IProductTypeService, ProductType> {

    @ApiOperation(value = "查询所有")
    @GetMapping("/all")
    public R<IPage<ProductType>> listAll(Integer type) {

        System.out.println(success(baseService.listAll(getPage(), type)));

        return success(baseService.listAll(getPage(), type));
    }

    @PostMapping("/saveProductType")
    public R<Boolean> saveCompany(ProductType productType) {
        return success(baseService.save(productType))
                ;
    }


    @ApiOperation(value = "修改物业人员信息")
    @PutMapping("/edit")
    public R<Boolean> editCompany(ProductType productType) {


        return success(baseService.editProPerson(productType));
    }

    @Override
    @DeleteMapping("/del/{id}")
    public R<Boolean> remove(@PathVariable("id") Long id) {
        return super.remove(id);
    }
}
