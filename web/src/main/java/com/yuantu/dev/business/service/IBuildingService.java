package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.Building;

import java.util.List;

/**
 * IBuildingService
 * <p>
 * 楼栋表 服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */

public interface IBuildingService extends IService<Building> {

    /**
     * 查询所有
     *
     * @param b
     * @return
     */
    List<Building> listAll(String b);

    /**
     * 分页查询所有楼栋信息
     *
     * @param page
     * @param building
     * @return
     */
    IPage<Building> page(Page page, Building building);

    /**
     * 修改楼栋信息
     *
     * @param building
     * @return
     */
    boolean update(Building building);

    /**
     * 新增楼栋
     *
     * @param building
     * @return
     */
    boolean saveBuilding(Building building);

}
