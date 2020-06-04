package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.PropertyPersonnel;
import com.yuantu.dev.business.vo.PropertyPersonnelSelectedVO;

import java.util.List;

public interface IPropertyPersonnelService extends IService<PropertyPersonnel> {
    IPage<PropertyPersonnel> queryUser(IPage<PropertyPersonnel> page, PropertyPersonnel propertyPersonnel);


    boolean editProPerson(PropertyPersonnel propertyPersonnel);


    List<PropertyPersonnelSelectedVO> listSelectedVO(Long userId);

}
