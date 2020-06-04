package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.dto.CompanyDTO;
import com.yuantu.dev.business.dto.OrderDTO;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.business.entity.Order;
import com.yuantu.dev.business.service.ICompanyInfoService;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.business.service.IOrderService;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * CompanyInfoController
 * <p>
 * 实现服务类
 * </p>
 *
 * @author 49030
 * @date 2019/11/30
 */
@Api(tags = "企业信息")
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController<IOrderService, Order> {

    @ApiOperation(value = "分页查询")
    @GetMapping("/page")
    public R<IPage<OrderDTO>> page(OrderDTO order) {
        return success(baseService.orderPage(getPage(), order));
    }


}
