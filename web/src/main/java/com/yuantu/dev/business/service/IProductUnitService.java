package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.ProductUnit;

import java.util.List;

/**
 * IProductUnitService
 * 产品单位表 服务类
 *
 * @author 49030
 * @date 2019/8/22
 */

public interface IProductUnitService extends IService<ProductUnit> {

    List<ProductUnit> all();
}
