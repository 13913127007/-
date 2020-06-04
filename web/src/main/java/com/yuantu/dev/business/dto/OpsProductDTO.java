package com.yuantu.dev.business.dto;

import com.yuantu.dev.business.entity.OpsProduct;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 产品详情DTO
 *
 * @author 49030
 * @date 2019/8/15
 */

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class OpsProductDTO extends OpsProduct {

    /**
     * 属性名
     */
    List<String> propertyNames;

    /**
     * 属性值
     */
    List<String> propertyValues;
}
