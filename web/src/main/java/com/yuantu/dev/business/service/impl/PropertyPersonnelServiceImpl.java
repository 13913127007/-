package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.PropertyPersonnel;

import com.yuantu.dev.business.mapper.PropertyPersonnelMapper;
import com.yuantu.dev.business.service.IPropertyPersonnelService;
import com.yuantu.dev.business.vo.PropertyPersonnelSelectedVO;
import com.yuantu.dev.common.ErrorCode;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyPersonnelServiceImpl extends ServiceImpl<PropertyPersonnelMapper, PropertyPersonnel> implements IPropertyPersonnelService {

    @Override
    public IPage<PropertyPersonnel> queryUser(IPage<PropertyPersonnel> page, PropertyPersonnel propertyPersonnel) {
        return page.setRecords(this.baseMapper.queryUser(page, propertyPersonnel));
    }

    @Override
    public boolean editProPerson(PropertyPersonnel propertyPersonnel) {
        Assert.fail(null == propertyPersonnel.getId(), ErrorCode.ID_REQUIRED);
        PropertyPersonnel dbUser = super.getById(propertyPersonnel.getId());
        Assert.fail(null == dbUser, "修改用户不存在");

        return super.updateById(propertyPersonnel);
    }

    @Override
    public List<PropertyPersonnelSelectedVO> listSelectedVO(Long propertyId) {
        return baseMapper.selectSelectedVO(propertyId);
    }
}
