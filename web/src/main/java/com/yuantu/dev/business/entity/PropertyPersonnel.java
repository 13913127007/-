package com.yuantu.dev.business.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import com.yuantu.dev.core.bean.SuperEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("property_personnel")
public class PropertyPersonnel extends BaseEntity {
    @ApiModelProperty(value = "物业人员名字")
    private String propertyPersonnelName;

    private String sex;

    private int age;

    private String address;

    private String phone;

}