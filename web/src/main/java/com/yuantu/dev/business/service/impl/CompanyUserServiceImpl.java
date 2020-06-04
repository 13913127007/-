package com.yuantu.dev.business.service.impl;

import com.baomidou.kisso.common.encrypt.MD5Salt;
import com.baomidou.kisso.common.util.RandomType;
import com.baomidou.kisso.common.util.RandomUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.dto.CompanyUserDTO;
import com.yuantu.dev.business.entity.CompanyUser;
import com.yuantu.dev.business.mapper.CompanyUserMapper;
import com.yuantu.dev.business.service.ICompanyUserService;
import com.yuantu.dev.common.ErrorCode;
import com.yuantu.dev.sys.entity.User;
import com.yuantu.dev.sys.entity.UserRole;
import com.yuantu.dev.sys.service.IUserRoleService;
import com.yuantu.dev.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * CompanyUserServiceImpl
 *
 * @author 49030
 * @date 2019/8/16
 */
@Service
public class CompanyUserServiceImpl extends ServiceImpl<CompanyUserMapper, CompanyUser> implements ICompanyUserService {
    @Autowired
    IUserService userService;
    @Autowired
    private IUserRoleService userRoleService;

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public boolean saveCompanyDto(CompanyUserDTO dto) {
        User user = dto.convert(User.class);
        user.setSalt(RandomUtil.getText(RandomType.MIX, 8));
        user.setPassword(MD5Salt.md5SaltEncode(user.getUsername() + user.getSalt(), dto.getPassword()));
        boolean userSaveFlag = userService.save(user)
                && this.saveBatch(dto.getCompanyIds().stream().map(id -> {
            CompanyUser companyUser = new CompanyUser();
            companyUser.setUserId(user.getId());
            companyUser.setCompanyId(id);
            return companyUser;
        }).collect(Collectors.toList()));
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId((long) 3);
        boolean userRoleSaveFlag = userRoleService.save(userRole);
        return userSaveFlag && userRoleSaveFlag;
    }

    @Override
    public IPage<CompanyUserDTO> queryUser(IPage<CompanyUserDTO> page, CompanyUserDTO room) {
        return page.setRecords(this.baseMapper.queryUser(page, room));
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public boolean updateByDTOId(CompanyUserDTO user) {
        return removeByUserId(user.getId()) && userService.updateById(user)
                && saveBatch(user.getCompanyIds().stream().map(id -> {
            CompanyUser companyUser = new CompanyUser();
            companyUser.setUserId(user.getId());
            companyUser.setCompanyId(id);
            return companyUser;
        }).collect(Collectors.toList()));
    }

    @Override
    public boolean removeByUserId(Serializable userId) {
        return super.remove(Wrappers.<CompanyUser>query().eq("user_id", userId));
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public boolean deleteCompanyUser(Long id) {
        return this.removeById(id) &&
                userRoleService.remove(Wrappers.<UserRole>query().eq("user_id", id)) &&
                userService.remove(Wrappers.<User>query().eq("id", id));
    }
}
