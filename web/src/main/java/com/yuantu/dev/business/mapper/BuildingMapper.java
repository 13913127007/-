package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.entity.Building;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * BuildingMapper
 * 楼栋表 Mapper接口
 *
 * @author 49030
 * @date 2019/7/29
 */
@Mapper
public interface BuildingMapper extends BaseMapper<Building> {

    /**
     * 查询所有楼栋
     *
     * @param building
     * @return
     */
    List<Building> listAll(@Param("buildingName") String building);


}
