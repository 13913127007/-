package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.OrderDTO;
import com.yuantu.dev.business.entity.CompanyLinker;
import com.yuantu.dev.business.entity.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ICompanyInfoService
 * <p>
 * 公司信息表 服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */

public interface ICompanyLinkerService extends IService<CompanyLinker> {


    /**
     * 查客户
     *
     * @param
     * @return
     */
    List<CompanyLinker> chaCustomer(Long id);


    boolean saveLinker(CompanyLinker customer);

}
