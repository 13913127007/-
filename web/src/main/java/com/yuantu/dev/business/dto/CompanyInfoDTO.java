package com.yuantu.dev.business.dto;

import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.sys.dto.UserDTO;
import com.yuantu.dev.sys.entity.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;


/**
 * CompanyInfoDTO
 *
 * @author 49030
 * @date 2019/8/8
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class CompanyInfoDTO extends CompanyInfo {

    private String userName;

    private String phone;

    private String address;


    private UserDTO user;

}
