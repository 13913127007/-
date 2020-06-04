package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * SalesSpecifications
 * 销售规格表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sales_specifications")
public class SalesSpecifications extends BaseEntity {

    @ApiModelProperty(value = "产品详情表id")
    private Long productDetailId;

    @ApiModelProperty(value = "属性值表id1")
    private Long propertyValueIdOne;

    @ApiModelProperty(value = "属性值表id2")
    private Long propertyValueIdTwo;

    @ApiModelProperty(value = "属性值表id3")
    private Long propertyValueIdThree;

    @ApiModelProperty(value = "属性值表id4")
    private Long propertyValueIdFour;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "数量")
    private Integer num;

    @ApiModelProperty(value = "是否库存限制（1：是；0：否）")
    private Integer numLimit;
}
