package com.yuantu.dev.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yuantu.dev.business.entity.CompanyCustomer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CustomerMapper extends BaseMapper<CompanyCustomer> {
    List<CompanyCustomer> queryUser(IPage<CompanyCustomer> page, @Param(value = "phone") List<String> phone);
}
