package com.yuantu.dev.miniapp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.miniapp.entity.MiniUser;

/**
 * <p>
 * 小程序用户表 服务类
 * </p>
 */
public interface IMiniUserService extends IService<MiniUser> {
    String login(String openid, String sessionKey);
}
