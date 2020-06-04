package com.yuantu.dev.business.dto;

import com.yuantu.dev.business.entity.CompanyInfo;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * CompanyDTO
 *
 * @author 49030
 * @date 2019/10/21
 */

@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class CompanyDTO extends CompanyInfo {

    @ApiModelProperty(value = "用户名")
    private String realName;

    @ApiModelProperty(value = "性别")
    private String sex;

    @ApiModelProperty(value = "联系方式")
    private String phone;
}
