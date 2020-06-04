package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yuantu.dev.business.entity.CycleType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * CycleTypeMapper
 * 周期类型表 Mapper接口
 *
 * @author 49030
 * @date 2019/8/26
 */
@Mapper
public interface CycleTypeMapper extends BaseMapper<CycleType> {

    /**
     * 查询所有
     *
     * @return
     */
    List<CycleType> listAll();

}
