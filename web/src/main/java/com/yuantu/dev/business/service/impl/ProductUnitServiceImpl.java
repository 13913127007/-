package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.ProductUnit;
import com.yuantu.dev.business.mapper.ProductUnitMapper;
import com.yuantu.dev.business.service.IProductUnitService;
import org.springframework.stereotype.Service;

import java.sql.Wrapper;
import java.util.List;

/**
 * ProductUnitServiceImpl
 * 产品单位表 服务实现类
 *
 * @author 49030
 * @date 2019/8/22
 */
@Service
public class ProductUnitServiceImpl extends ServiceImpl<ProductUnitMapper, ProductUnit> implements IProductUnitService {
    @Override
    public List<ProductUnit> all() {
        return super.list(Wrappers.<ProductUnit>query().select("id", "name").
                eq("deleted", 0).eq("status", "0").
                orderByDesc("id"));
    }
}
