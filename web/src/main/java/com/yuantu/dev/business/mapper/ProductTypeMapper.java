package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.entity.ProductType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProductTypeMapper
 * <p>
 * 产品类别表 Mapper 接口
 * </p>
 *
 * @author 49030
 * @date 2019/8/12
 */
@Mapper
public interface ProductTypeMapper extends BaseMapper<ProductType> {

    /**
     * 查询所有产品类别
     *
     * @param type
     * @return
     */
    List<ProductType> selectAll(IPage<ProductType> page, @Param("type") Integer type);
}
