package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.bean.SuperEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * CompanyAddress
 * 公司地址表
 *
 * @author 49030
 * @date 2019/7/29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("relation_company_address")
public class CompanyAddress extends SuperEntity {

    @ApiModelProperty(value = "公司信息表id")
    private Long companyId;

    @ApiModelProperty(value = "楼栋表id")
    private Long buildId;

    @ApiModelProperty(value = "门牌表id")
    private Long roomId;
}
