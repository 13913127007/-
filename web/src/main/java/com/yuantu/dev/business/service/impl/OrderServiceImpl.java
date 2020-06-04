package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.dto.CompanyInfoDTO;
import com.yuantu.dev.business.dto.OrderDTO;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.business.entity.Order;
import com.yuantu.dev.business.mapper.CompanyInfoMapper;
import com.yuantu.dev.business.mapper.OrderMapper;
import com.yuantu.dev.business.service.ICompanyInfoService;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.business.service.IOrderService;
import com.yuantu.dev.common.ErrorCode;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * CompanyInfoServiceImpl
 * <p>
 * 公司信息表 实现服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {


    @Override
    public IPage<OrderDTO> orderPage(IPage<OrderDTO> page, OrderDTO orderDTO) {
        return page.setRecords(this.baseMapper.pageOrder(page, orderDTO));
    }


}
