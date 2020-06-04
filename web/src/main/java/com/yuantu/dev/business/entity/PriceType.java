package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * PriceType
 * 价格类型表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("price_type")
public class PriceType extends BaseEntity {

    @ApiModelProperty(value = "产品详情表id")
    private Long productDetailId;

    @ApiModelProperty(value = "节假日价格")
    private BigDecimal holidayPrice;

    @ApiModelProperty(value = "周末价格")
    private BigDecimal weekendPrice;

    @ApiModelProperty(value = "平常价格")
    private BigDecimal commonlyPrice;
}
