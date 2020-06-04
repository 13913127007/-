package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.entity.CycleType;
import com.yuantu.dev.business.service.ICycleTypeService;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * CycleTypeController
 * 周期类型表 前端控制器
 *
 * @author 49030
 * @date 2019/8/26
 */
@Api(tags = {"周期类型"})
@RestController
@RequestMapping("/cycleType")
public class CycleTypeController extends BaseController<ICycleTypeService, CycleType> {

    @ApiOperation(value = "查询所有")
    @GetMapping("listAll")
    public R<List<CycleType>> list() {
        return success(baseService.listAll());
    }
}
