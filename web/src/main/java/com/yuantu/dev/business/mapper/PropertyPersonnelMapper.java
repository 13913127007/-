package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.entity.PropertyPersonnel;
import com.yuantu.dev.business.vo.PropertyPersonnelSelectedVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PropertyPersonnelMapper extends BaseMapper<PropertyPersonnel> {
    List<PropertyPersonnel> queryUser(IPage<PropertyPersonnel> page, @Param(value = "propertyPersonnel") PropertyPersonnel propertyPersonnel);


    List<PropertyPersonnelSelectedVO> selectSelectedVO(@Param("id") Long propertyId);
}
