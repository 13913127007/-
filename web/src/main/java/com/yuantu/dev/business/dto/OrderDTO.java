package com.yuantu.dev.business.dto;

import com.yuantu.dev.business.entity.Order;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class OrderDTO extends Order {
    private String cusname;
    private String address;

}
