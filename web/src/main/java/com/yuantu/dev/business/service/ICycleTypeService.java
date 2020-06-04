package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.CycleType;

import java.util.List;

/**
 * ICycleTypeService
 * 周期类型 服务层
 *
 * @author 49030
 * @date 2019/8/26
 */

public interface ICycleTypeService extends IService<CycleType> {
    /**
     * 查询所有
     *
     * @return
     */
    List<CycleType> listAll();
}
