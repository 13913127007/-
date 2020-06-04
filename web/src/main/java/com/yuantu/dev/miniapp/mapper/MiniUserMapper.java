package com.yuantu.dev.miniapp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yuantu.dev.miniapp.entity.MiniUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 小程序用户表 Mapper 接口
 * </p>
 */

@Mapper
public interface MiniUserMapper extends BaseMapper<MiniUser> {

}
