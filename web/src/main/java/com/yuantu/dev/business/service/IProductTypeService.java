package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.ProductType;

import java.util.List;

/**
 * IProductTypeService
 * <p>
 * 产品类别表服务类
 * </p>
 *
 * @author 49030
 * @date 2019/8/12
 */

public interface IProductTypeService extends IService<ProductType> {

    /**
     * 查询所有产品类别
     *
     * @param type
     * @return
     */


    IPage<ProductType> listAll(IPage<ProductType> page, Integer type);

    boolean editProPerson(ProductType productType);
}
