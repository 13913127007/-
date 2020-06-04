package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * PropertyValue
 * 属性值表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("property_value")
public class PropertyValue extends BaseEntity {

    @ApiModelProperty(value = "属性名称表id")
    private Long propNameId;

    @ApiModelProperty(value = "属性值")
    private String propertyValues;

    @ApiModelProperty(value = "周期类型表id")
    private Long cycleTypeId;

    @ApiModelProperty(value = "产品特殊加价类型表id")
    private Long propertyValueTypeId;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;

    @ApiModelProperty(value = "排序")
    private Integer sort;

}
