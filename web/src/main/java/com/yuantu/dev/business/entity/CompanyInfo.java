package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * CompanyInfo
 * 企业信息表
 *
 * @author 49030
 * @date 2019/7/29
 */

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("company_info")
public class CompanyInfo extends BaseEntity {

    @ApiModelProperty(value = "公司名称")
    private String name;

    @ApiModelProperty(value = "公司地址")
    private String address;

    @ApiModelProperty(value = "占用面积")
    private Float area;

    @ApiModelProperty(value = "物业调度")
    private int propertyId;

    @ApiModelProperty(value = "状态(-1:禁用；0:正常)")
    private Integer status;


    @ApiModelProperty(value = "用户名称 用于展示")
    @TableField(exist = false)
    private String showUserName;

    @ApiModelProperty(value = "用户id 用于展示")
    @TableField(exist = false)
    private String showUserId;
}
