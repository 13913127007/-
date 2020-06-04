package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.CycleType;
import com.yuantu.dev.business.mapper.CycleTypeMapper;
import com.yuantu.dev.business.service.ICycleTypeService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CycleTypeServiceImpl
 * 周期类型表 服务实现类
 *
 * @author 49030
 * @date 2019/8/26
 */
@Service
public class CycleTypeServiceImpl extends ServiceImpl<CycleTypeMapper, CycleType> implements ICycleTypeService {
    @Override
    public List<CycleType> listAll() {
        return baseMapper.listAll();
    }
}
