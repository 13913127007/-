package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.CompanyUserDTO;
import com.yuantu.dev.business.entity.CompanyUser;

import java.io.Serializable;
import java.util.List;

/**
 * ICompanyUserService
 * 公司用户表 服务类
 *
 * @author 49030
 * @date 2019/8/16
 */

public interface ICompanyUserService extends IService<CompanyUser> {

    /**
     * 新增业主
     *
     * @param dto
     * @return
     */
    boolean saveCompanyDto(CompanyUserDTO dto);

    /**
     * 分页查询
     *
     * @param page
     * @param room
     * @return
     */
    IPage<CompanyUserDTO> queryUser(IPage<CompanyUserDTO> page, CompanyUserDTO room);

    /**
     * 修改业主所属公司
     *
     * @param user
     * @return
     */
    boolean updateByDTOId(CompanyUserDTO user);

    /**
     * 根据用户id删除
     *
     * @param userId
     * @return
     */
    boolean removeByUserId(Serializable userId);

    /**
     * 删除用户相关信息
     *
     * @param id
     * @return
     */
    boolean deleteCompanyUser(Long id);
}
