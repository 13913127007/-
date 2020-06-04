package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * PropertyValueType
 * 产品特殊加价类型表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("property_value_type")
public class PropertyValueType extends BaseEntity {

    @ApiModelProperty(value = "父id")
    private Long pId;

    @ApiModelProperty(value = "类型名称")
    private Long name;
}
