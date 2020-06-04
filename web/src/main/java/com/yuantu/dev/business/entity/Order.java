package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("order")
public class Order extends BaseEntity {

    private Integer customerId;
    private Integer companyAddressId;

    private Integer orderNumber;

    private String remark;
    private Integer totlAmount;
    private Integer couponId;
    private Integer reatilyAmount;


    private Integer isPyment;
    private Integer isDisp;
    private Integer isRating;
    private Integer orderStatus;
    private Integer status;


}
