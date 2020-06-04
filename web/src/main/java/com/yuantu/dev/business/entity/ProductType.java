package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * ProductType
 * <p>
 * 产品类型表
 * </p>
 *
 * @author 49030
 * @date 2019/8/12
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("product_type")
public class ProductType extends BaseEntity {

    @ApiModelProperty(value = "服务名称")
    private String name;

    @ApiModelProperty(value = "图标")
    private String icon;

    @ApiModelProperty(value = "类别(1:服务、2:商品)")
    private Integer type;

    @ApiModelProperty(value = "是否上架")
    private Integer isShelves;
}
