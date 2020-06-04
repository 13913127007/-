package com.yuantu.dev.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yuantu.dev.sys.dto.UserInfoDTO;
import com.yuantu.dev.sys.entity.Org;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统组织表 Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2018-11-07
 */
@Mapper
public interface OrgMapper extends BaseMapper<Org> {

    /**
     * <p>
     * 查询指定顶级组织 ID 下所有组织列表
     * </p>
     *
     * @param topOrgId 顶级组织 ID
     * @return
     */
    List<Org> selectTopList(@Param("topOrgId") Long topOrgId);

    /**
     * <p>
     * 查询所有组织列表
     * </p>
     *
     * @param all
     * @return
     */
    List<Org> listAll(@Param("all") Boolean all);

    /**
     * 根据orgId查询组织下所有roleId角色
     *
     * @param orgId  组织ID
     * @param roleId 角色ID
     * @return 用户列表
     */
    List<UserInfoDTO> getUserByOrgIdAndRoleId(@Param("orgId") long orgId, @Param("roleId") long roleId);
}
