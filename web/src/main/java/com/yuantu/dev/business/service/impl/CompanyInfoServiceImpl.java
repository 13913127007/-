package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.dto.CompanyInfoDTO;

import com.yuantu.dev.business.entity.Company;
import com.yuantu.dev.business.entity.CompanyInfo;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.mapper.CompanyInfoMapper;

import com.yuantu.dev.business.service.ICompanyInfoService;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.common.ErrorCode;
import com.yuantu.dev.common.utils.KeyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * CompanyInfoServiceImpl
 * <p>
 * 公司信息表 实现服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */
@Service
public class CompanyInfoServiceImpl extends ServiceImpl<CompanyInfoMapper, Company> implements ICompanyInfoService {

    @Resource
    private ICustomerService customerService;

    @Override
    public IPage<Company> companyPage(IPage<Company> page, Company companyInfoDTO) {
        return page.setRecords(this.baseMapper.pageCompany(page, companyInfoDTO));
    }

    @Override
    public boolean saveCompany(Company dto) {

        dto.setId(Long.valueOf(KeyUtil.genUniqueKey()));
        return this.baseMapper.saveCompany(dto);
    }

    @Override
    public boolean deleteCompany(Long id) {
        return super.removeById(id) && customerService.remove(Wrappers.<CompanyCustomer>query().eq("companyid", id));
    }

    @Override
    public boolean editCompany(Company companyInfo) {
        // Assert.fail(null == companyInfo.getId(), ErrorCode.ID_REQUIRED);
        Company dbUser = super.getById(companyInfo.getId());
        Assert.fail(null == dbUser, "修改用户不存在");

        return super.updateById(companyInfo);
    }

}
