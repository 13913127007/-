package com.yuantu.dev.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.sys.entity.UserOrg;
import com.yuantu.dev.sys.mapper.UserOrgMapper;
import com.yuantu.dev.sys.service.IUserOrgService;
import com.yuantu.dev.sys.vo.UserOrgSelectedVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 系统用户组织关联表 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2018-09-16
 */
@Service
public class UserOrgServiceImpl extends ServiceImpl<UserOrgMapper, UserOrg> implements IUserOrgService {


    @Override
    public List<UserOrgSelectedVO> listSelectedVO(Long userId) {
        return baseMapper.selectSelectedVO(userId);
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean updateByIds(Long userId, List<Long> ids) {
        Assert.fail(null == userId || CollectionUtils.isEmpty(ids), "用户组织 ID 不能为空");
        return removeByUserId(userId) && saveBatch(ids.stream().map(id -> {
            UserOrg userOrg = new UserOrg();
            userOrg.setUserId(userId);
            userOrg.setOrgId(id);
            return userOrg;
        }).collect(Collectors.toList()));
    }


    @Override
    public boolean removeByUserId(Serializable userId) {
        return super.remove(Wrappers.<UserOrg>query().eq("user_id", userId));
    }

    @Override
    public boolean relation(Serializable orgId) {
        return count(new QueryWrapper<UserOrg>().eq("org_id", orgId)) > 0;
    }
}
