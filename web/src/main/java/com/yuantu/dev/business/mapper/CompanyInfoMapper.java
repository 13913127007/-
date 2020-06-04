package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.dto.CompanyInfoDTO;
import com.yuantu.dev.business.entity.Company;
import com.yuantu.dev.business.entity.CompanyInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CompanyInfoMapper
 *
 * @author 49030
 * @date 2019/7/29
 */
@Mapper
public interface CompanyInfoMapper extends BaseMapper<Company> {

    List<Company> pageCompany(IPage<Company> page, @Param(value = "company") Company companyInfo);


    boolean saveCompany(Company company);


}
