package com.yuantu.dev.business.dto;


import lombok.Data;
import lombok.experimental.Accessors;

/**
 * CompanyDTO
 *
 * @author 49030
 * @date 2019/10/21
 */

@Data
@Accessors(chain = true)
public class CustomerDTO {

    private int companyid;
    private String name;
    private String phone;
}
