package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.entity.Building;
import com.yuantu.dev.business.mapper.BuildingMapper;
import com.yuantu.dev.business.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * BuildingServiceImpl
 * <p>
 * 楼栋表 服务实现类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */
@Service
public class BuildingServiceImpl extends ServiceImpl<BuildingMapper, Building> implements IBuildingService {

    @Override
    public List<Building> listAll(String b) {
        return baseMapper.listAll(b);
    }

    @Override
    public IPage<Building> page(Page page, Building building) {
        QueryWrapper<Building> qw = new QueryWrapper<>();
        qw.setEntity(building);
        return super.page(page, qw);
    }

    @Override
    public boolean update(Building building) {
        Assert.fail(compare(building.getName()), "名字重复!");
        return updateById(building);
    }

    @Override
    public boolean saveBuilding(Building building) {
        // String.trim()去除字符串首尾空格
        String buildingName = building.getName().trim();
        Assert.fail(buildingName.isEmpty(), "楼栋名不能为空!");
        Assert.fail(compare(building.getName()), "楼栋名重复!");
        return super.save(building);
    }

    /**
     * 判断重名
     * true 重名，false 不重名
     */
    private boolean compare(String name) {
        return count(new QueryWrapper<Building>().eq("name", name)) > 0;
    }


}
