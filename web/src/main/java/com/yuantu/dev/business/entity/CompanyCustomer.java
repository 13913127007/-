package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.bean.SuperEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@TableName("kh_person")
public class CompanyCustomer extends SuperEntity {

    private String name;

    /* private  String accountnumber;
   @ApiModelProperty(value = "客户密码")
    private  String  pwd ;
    private  String  sex ;*/

    private String phone;
 /*   private  int  companyid ;
    @TableField(exist=false)
    private  String  companyname ;
*/
}