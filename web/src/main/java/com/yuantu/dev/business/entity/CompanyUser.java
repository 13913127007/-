package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.bean.SuperEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * CompanyUser
 *
 * @author 49030
 * @date 2019/8/16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("relation_company_user")
public class CompanyUser extends SuperEntity {
    @ApiModelProperty(value = "用户 ID")
    private Long userId;

    @ApiModelProperty(value = "公司 ID")
    private Long companyId;
}
