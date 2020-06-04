package com.yuantu.dev.business.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("service_person")
public class ServicePersonnel extends BaseEntity {
    @ApiModelProperty(value = "服务人员名字")
    private String serviceName;

    private String sex;

    private int age;

    private String address;

    private String phone;

    private String status;

}