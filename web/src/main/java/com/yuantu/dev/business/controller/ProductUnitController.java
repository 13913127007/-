package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.entity.ProductUnit;
import com.yuantu.dev.business.service.IProductUnitService;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * ProductUnitController
 * 产品单位 前端控制器
 *
 * @author 49030
 * @date 2019/8/22
 */
@Api(tags = {"产品单位"})
@RestController
@RequestMapping("/productUnit")
public class ProductUnitController extends BaseController<IProductUnitService, ProductUnit> {

    @ApiOperation(value = "查询 所有产品单位")
    @GetMapping("/list")
    public R<List<ProductUnit>> list() {
        return success(baseService.all());
    }
}
