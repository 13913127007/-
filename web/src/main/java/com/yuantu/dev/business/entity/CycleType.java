package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * CycleType
 * 周期表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("cycle_type")
public class CycleType extends BaseEntity {

    @ApiModelProperty(value = "周期名称")
    private String name;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;
}
