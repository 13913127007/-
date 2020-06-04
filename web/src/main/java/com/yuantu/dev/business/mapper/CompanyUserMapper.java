package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.dto.CompanyUserDTO;
import com.yuantu.dev.business.entity.CompanyUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CompanyUserMapper
 *
 * @author 49030
 * @date 2019/8/16
 */
@Mapper
public interface CompanyUserMapper extends BaseMapper<CompanyUser> {

    /**
     * 分页查询
     *
     * @param page
     * @param user
     * @return
     */
    List<CompanyUserDTO> queryUser(IPage<CompanyUserDTO> page, @Param(value = "user") CompanyUserDTO user);
}
