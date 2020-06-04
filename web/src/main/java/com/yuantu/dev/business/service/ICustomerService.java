package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.CustomerDTO;
import com.yuantu.dev.business.entity.CompanyCustomer;

import java.util.List;

public interface ICustomerService extends IService<CompanyCustomer> {
    /**
     * 查客户
     *
     * @param
     * @return
     */
    IPage<CompanyCustomer> chaCustomer(IPage<CompanyCustomer> page, Long id);


    boolean updateById(CompanyCustomer customer);


    IPage<CompanyCustomer> queryUser(IPage<CompanyCustomer> page, List<String> phone);

    /**
     * <p>
     * 查询用户账号是否已存在
     * </p>
     *
     * @param id       用户 ID
     * @param username 用户账号
     * @return
     */
    int userNameCount(Long id, String username);

    /**
     * <p>
     * 保存用户角色关系信息
     * </p>
     *
     * @param
     * @return
     */
    boolean saveDto(CustomerDTO customerDTO);


    /**
     * <p>
     * 修改用户角色关系信息
     * </p>
     *
     * @param dto 用户 DTO
     * @return
     */
    //boolean updateDtoById(UserDTO dto);
}
