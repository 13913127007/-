package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 产品详情表
 *
 * @author 49030
 * @date 2019/8/15
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("product_detail")
public class OpsServe extends BaseEntity {

    @ApiModelProperty(value = "类型表id")
    private Long prodTypeId;

    @ApiModelProperty(value = "名称")
    private String name;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "单位表id")
    private Long prodUnitId;

    @ApiModelProperty(value = "库存数量")
    private Integer inventory;

    @ApiModelProperty(value = "销量")
    private Integer salesNum;

    @ApiModelProperty(value = "产品默认图")
    private String defaultImg;

    @ApiModelProperty(value = "产品大图")
    private String productImg;

    @ApiModelProperty(value = "产品描述文字")
    private String description;

    @ApiModelProperty(value = "产品详情图")
    private String detailsImg;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;

    @ApiModelProperty(value = "类型名称 用于展示")
    @TableField(exist = false)
    private String typeName;

    @ApiModelProperty(value = "单位名称 用于展示")
    @TableField(exist = false)
    private String unitName;

    @ApiModelProperty(value = "属性名称 用于展示")
    @TableField(exist = false)
    private String showPropertyName;

    @ApiModelProperty(value = "属性值 用于展示")
    @TableField(exist = false)
    private String showPropertyValue;

    @ApiModelProperty(value = "默认价格 用于展示")
    @TableField(exist = false)
    private BigDecimal commonlyPrice;

    @ApiModelProperty(value = "默认价格 用于展示")
    @TableField(exist = false)
    private BigDecimal weekendPrice;

    @ApiModelProperty(value = "默认价格 用于展示")
    @TableField(exist = false)
    private BigDecimal holidayPrice;
}
