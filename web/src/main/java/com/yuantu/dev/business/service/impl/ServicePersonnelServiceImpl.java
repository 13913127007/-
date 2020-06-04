package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.ServicePersonnel;
import com.yuantu.dev.business.mapper.ServicePersonnelMapper;
import com.yuantu.dev.business.service.IServicePersonnelService;
import com.yuantu.dev.common.ErrorCode;
import org.springframework.stereotype.Service;


@Service
public class ServicePersonnelServiceImpl extends ServiceImpl<ServicePersonnelMapper, ServicePersonnel> implements IServicePersonnelService {

    @Override
    public IPage<ServicePersonnel> queryUser(IPage<ServicePersonnel> page, ServicePersonnel servicePersonnel) {
        return page.setRecords(this.baseMapper.queryUser(page, servicePersonnel));
    }

    @Override
    public boolean editSerPerson(ServicePersonnel servicePersonnel) {
        Assert.fail(null == servicePersonnel.getId(), ErrorCode.ID_REQUIRED);
        ServicePersonnel dbUser = super.getById(servicePersonnel.getId());
        Assert.fail(null == dbUser, "修改用户不存在");

        return super.updateById(servicePersonnel);
    }

 /*   @Override
    public List<PropertyPersonnelSelectedVO> listSelectedVO(Long propertyId) {
        return baseMapper.selectSelectedVO(propertyId);
    }*/
}
