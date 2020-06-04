package com.yuantu.dev.sys.dto;

import com.yuantu.dev.sys.entity.User;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <p>
 * 系统用户 DTO
 * </p>
 *
 * @author jobob
 * @since 2018-10-05
 */
@Data
@Accessors(chain = true)
public class UserDTO extends User {

    /**
     * 角色 ID 集合
     */
    List<Long> roleIds;

    /**
     * 组织 ID 集合
     */
    List<Long> orgIds;

}
