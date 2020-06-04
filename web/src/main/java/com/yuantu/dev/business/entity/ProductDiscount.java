package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * ProductDiscount
 * 产品折扣表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("product_discount")
public class ProductDiscount extends BaseEntity {

    @ApiModelProperty(value = "产品详情表id")
    private Long productDetailId;

    @ApiModelProperty(value = "产品数量")
    private Integer num;

    @ApiModelProperty(value = "超出数量")
    private Integer excessQuantity;

    @ApiModelProperty(value = "折扣")
    private Integer discount;

    @ApiModelProperty(value = "类型(1:总价折扣;2:部分折扣)")
    private Integer discountType;

}
