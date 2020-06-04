package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.entity.CompanyAddress;

import java.io.Serializable;
import java.util.List;

/**
 * ICompanyAddressService
 * <p>
 * 公司地址表 服务类
 * </p>
 *
 * @author 49030
 * @date 2019/7/30
 */

public interface ICompanyAddressService extends IService<CompanyAddress> {

    /**
     * 更新企业门牌关系
     *
     * @param id     企业 id
     * @param roomId 门牌id
     * @return
     */
    boolean updateByIds(Long id, List<Long> roomId);

    /**
     * 删除企业门牌关系
     *
     * @param comId 公司id
     * @return
     */
    boolean removeByCompanyId(Serializable comId);

}
