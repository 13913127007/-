package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.bean.SuperEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("kh_company")
public class Company extends SuperEntity {

    private String name;

    private String address;

    private Double area;
}
