package com.yuantu.dev.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.sys.dto.UserInfoDTO;
import com.yuantu.dev.sys.entity.Org;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 系统组织表 服务类
 * </p>
 *
 * @author jobob
 * @since 2018-11-07
 */
public interface IOrgService extends IService<Org> {

    /**
     * <p>
     * 查询指定顶级组织 ID 下所有组织列表
     * </p>
     *
     * @param topOrgId 顶级组织 ID
     * @return
     */
    List<Org> selectTopList(Long topOrgId);

    /**
     * <p>
     * 查询指定顶级组织
     * </p>
     *
     * @return
     */
    List<Org> listTopOrg();

    /**
     * <p>
     * 查询指定顶级组织
     * </p>
     *
     * @return
     */
    List<Org> listAll(Boolean all);

    /**
     * <p>
     * 添加顶级组织
     * </p>
     *
     * @return
     */
    Boolean addTopOrg(Org org);

    /**
     * <p>
     * 查询 ID 子节点数
     * </p>
     *
     * @param id 主键 ID
     * @return
     */
    Integer childNode(Serializable id);

    /**
     * 根据orgId查询组织下所有roleId角色
     *
     * @param orgId  组织ID
     * @param roleId 角色ID
     * @return 用户列表
     */
    List<UserInfoDTO> getUserByOrgIdAndRoleId(long orgId, long roleId);
}
