package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.dto.CustomerDTO;
import com.yuantu.dev.business.entity.CompanyCustomer;
import com.yuantu.dev.business.entity.CompanyLinker;
import com.yuantu.dev.business.mapper.CustomerMapper;
import com.yuantu.dev.business.service.ICompanyLinkerService;
import com.yuantu.dev.business.service.ICustomerService;
import com.yuantu.dev.common.ErrorCode;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, CompanyCustomer> implements ICustomerService {

    @Autowired
    private ICompanyLinkerService companyLinkerService;

    @Override
    public IPage<CompanyCustomer> chaCustomer(IPage<CompanyCustomer> page, Long id) {

        List<CompanyLinker> phonelist = companyLinkerService.chaCustomer(id);
        List<String> phone = phonelist.stream().map(u -> u.getPersonPhone()).collect(Collectors.toList());

        return this.queryUser(page, phone);
    }

    @Override
    public boolean updateById(CompanyCustomer customer) {
        Assert.fail(null == customer.getPhone(), ErrorCode.ID_REQUIRED);
        CompanyCustomer dbUser = super.getById(customer.getPhone());
        Assert.fail(null == dbUser, "修改用户不存在");

        return super.updateById(customer);
    }


    @Override
    public IPage<CompanyCustomer> queryUser(IPage<CompanyCustomer> page, List<String> phone) {
        return page.setRecords(this.baseMapper.queryUser(page, phone));
    }

    @Override
    public int userNameCount(Long id, String cusname) {
        if (id != -1) {
            return super.count(Wrappers.<CompanyCustomer>query().select("id").ne("id", id).eq("cusname", cusname));
        } else {
            return super.count(Wrappers.<CompanyCustomer>query().select("id").eq("cusname", cusname));
        }
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean saveDto(CustomerDTO customerDTO) {
        CompanyLinker companyLinker = new CompanyLinker();
        companyLinker.setCompanyid(customerDTO.getCompanyid());
        companyLinker.setPersonPhone(customerDTO.getPhone());
        companyLinkerService.saveLinker(companyLinker);

        CompanyCustomer companyCustomer = new CompanyCustomer();
        BeanUtils.copyProperties(customerDTO, companyCustomer);
        return super.save(companyCustomer);
    }
}


