package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@TableName("kh_company_linker")
public class CompanyLinker {

    private int companyid;

    private String personPhone;
}
