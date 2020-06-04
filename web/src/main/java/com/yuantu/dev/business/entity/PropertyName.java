package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * PropertyName
 * 属性名称表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("property_name")
public class PropertyName extends BaseEntity {

    @ApiModelProperty(value = "属性名")
    private String name;

    @ApiModelProperty(value = "产品明细表id")
    private Long prodDetId;

    @ApiModelProperty(value = "属性名类型(1:周期;2:次数;3：其他)")
    private Integer type;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;

    @ApiModelProperty(value = "排序")
    private Integer sort;

}
