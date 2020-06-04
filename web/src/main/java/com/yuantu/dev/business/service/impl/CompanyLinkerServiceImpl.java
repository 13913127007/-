package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.CompanyLinker;
import com.yuantu.dev.business.mapper.CompanyLinkerMapper;
import com.yuantu.dev.business.service.ICompanyLinkerService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyLinkerServiceImpl extends ServiceImpl<CompanyLinkerMapper, CompanyLinker> implements ICompanyLinkerService {


    @Override
    public List<CompanyLinker> chaCustomer(Long id) {
        return super.list(Wrappers.<CompanyLinker>query().select("person_phone").eq("companyid", id));
    }

    @Override
    public boolean saveLinker(CompanyLinker companyLinker) {
        return super.save(companyLinker);
    }
}
