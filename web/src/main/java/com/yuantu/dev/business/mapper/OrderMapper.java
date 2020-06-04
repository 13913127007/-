package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.dto.OrderDTO;
import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.business.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CompanyInfoMapper
 *
 * @author 49030
 * @date 2019/7/29
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

    List<OrderDTO> pageOrder(IPage<OrderDTO> page, @Param(value = "order") OrderDTO order);


}
