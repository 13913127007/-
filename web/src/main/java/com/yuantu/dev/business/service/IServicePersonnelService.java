package com.yuantu.dev.business.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.ServicePersonnel;


public interface IServicePersonnelService extends IService<ServicePersonnel> {
    IPage<ServicePersonnel> queryUser(IPage<ServicePersonnel> page, ServicePersonnel servicePersonnel);


    boolean editSerPerson(ServicePersonnel servicePersonnel);
    /* List<PropertyPersonnelSelectedVO> listSelectedVO(Long userId);*/

}
