package com.yuantu.dev.miniapp.service.impl;

import com.baomidou.kisso.common.encrypt.MD5Salt;
import com.baomidou.kisso.common.util.RandomType;
import com.baomidou.kisso.common.util.RandomUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.miniapp.entity.MiniUser;
import com.yuantu.dev.miniapp.mapper.MiniUserMapper;
import com.yuantu.dev.miniapp.service.IMiniUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 小程序用户表 服务实现类
 * </p>
 */
@Service
public class MiniUserServiceImpl extends ServiceImpl<MiniUserMapper, MiniUser> implements IMiniUserService {
    @Override
    public String login(String openid, String sessionKey) {
        MiniUser miniUser = new MiniUser();
        miniUser.setOpenid(openid);
        miniUser.setSessionKey(sessionKey);
        miniUser.setSalt(RandomUtil.getText(RandomType.MIX, 8));
        miniUser.setToken(MD5Salt.md5SaltEncode(openid + miniUser.getSalt(), sessionKey));
        boolean flag = this.saveOrUpdate(miniUser);
        return flag ? miniUser.getToken() : "";
    }
}
