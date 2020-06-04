package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.ProductType;
import com.yuantu.dev.business.mapper.ProductTypeMapper;
import com.yuantu.dev.business.service.IProductTypeService;
import com.yuantu.dev.common.ErrorCode;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProductTypeServiceImpl
 * <p>
 * 产品类别表服务实现类
 * </p>
 *
 * @author 49030
 * @date 2019/8/12
 */
@Service
public class ProductTypeServiceImpl extends ServiceImpl<ProductTypeMapper, ProductType> implements IProductTypeService {

    @Override
    public IPage<ProductType> listAll(IPage<ProductType> page, Integer type) {
        return page.setRecords(this.baseMapper.selectAll(page, type));
    }

    @Override
    public boolean editProPerson(ProductType productType) {
        Assert.fail(null == productType.getId(), ErrorCode.ID_REQUIRED);
        ProductType dbUser = super.getById(productType.getId());
        Assert.fail(null == dbUser, "修改用户不存在");

        return super.updateById(productType);
    }
}
