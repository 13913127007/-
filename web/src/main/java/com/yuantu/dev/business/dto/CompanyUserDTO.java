package com.yuantu.dev.business.dto;

import com.yuantu.dev.sys.entity.User;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * CompanyUserDTO
 * 公司用户DTO
 *
 * @author 49030
 * @date 2019/8/16
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
public class CompanyUserDTO extends User {

    /**
     * 公司id
     */
    List<Long> companyIds;

    /**
     * 角色id
     */
    List<Long> roleId;
}
