package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.CompanyInfoDTO;
import com.yuantu.dev.business.entity.Company;
import com.yuantu.dev.business.entity.CompanyInfo;

/**
 * ICompanyInfoService
 * <p>
 * 公司信息表 服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */

public interface ICompanyInfoService extends IService<Company> {

    /**
     * 分页查询企业信息
     *
     * @param page
     * @param companyInfo
     * @return
     */
    IPage<Company> companyPage(IPage<Company> page, Company companyInfo);

    /**
     * 新增企业信息
     *
     * @param dto
     * @return
     */
    boolean saveCompany(Company dto);

    /**
     * 删除企业信息
     *
     * @param
     * @return
     */
    boolean deleteCompany(Long id);

    /**
     * 修改企业信息
     *
     * @param
     * @return
     */
    boolean editCompany(Company companyInfo);


}
