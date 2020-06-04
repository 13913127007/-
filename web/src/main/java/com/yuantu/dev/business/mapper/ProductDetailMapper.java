package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.dto.OpsProductDTO;
import com.yuantu.dev.business.entity.OpsProduct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProductDetailMapper
 *
 * @author 49030
 * @date 2019/8/15
 */
@Mapper
public interface ProductDetailMapper extends BaseMapper<OpsProduct> {

    List<OpsProductDTO> queryProductDetail(IPage<OpsProductDTO> page, @Param(value = "detail") OpsProductDTO detail);
}
