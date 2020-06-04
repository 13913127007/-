package com.yuantu.dev.business.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yuantu.dev.core.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.sql.Date;

/**
 * DictHolidayDate
 * 节假日时间日期对应表
 *
 * @author 49030
 * @date 2019/8/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("dict_holiday_date")
public class DictHolidayDate extends BaseEntity {

    @ApiModelProperty(value = "节假日名称表id")
    private Long holidayNameId;

    @ApiModelProperty(value = "节假日具体时间")
    private Date date;
}
