package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.CompanyInfoDTO;
import com.yuantu.dev.business.dto.OrderDTO;
import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.business.entity.Order;

/**
 * ICompanyInfoService
 * <p>
 * 公司信息表 服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */

public interface IOrderService extends IService<Order> {

    /**
     * 分页查询
     *
     * @param page
     * @param orderDTO
     * @return
     */
    IPage<OrderDTO> orderPage(IPage<OrderDTO> page, OrderDTO orderDTO);

    /**
     * 新增
     * @param dto
     * @return
     */
    /* boolean saveCompany(CompanyInfoDTO dto);*/

    /**
     * 删除
     * @param
     * @return
     */
    /* boolean deleteOrder(Long id);*/

    /**
     * 修改
     * @param
     * @return
     */
    /*  boolean editOrder(CompanyInfo companyInfo);*/


}
