package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("order_detail")
public class OrderDetail extends BaseEntity {

    private Integer orderId;
    private Integer productId;
    private Integer productName;
    private Integer productPrice;
    private Integer productNum;
    private Integer appointmentServerTime;
    private Integer serverStartTime;
    private Integer serverFinishTime;
    private Integer allottedTime;


}
