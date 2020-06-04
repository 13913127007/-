package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * ProductUnit
 * 产品单位表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("product_unit")
public class ProductUnit extends BaseEntity {

    @ApiModelProperty(value = "服务/商品单位")
    private String name;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;
}
