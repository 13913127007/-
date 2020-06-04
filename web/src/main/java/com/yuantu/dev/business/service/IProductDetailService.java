package com.yuantu.dev.business.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yuantu.dev.business.dto.OpsProductDTO;
import com.yuantu.dev.business.entity.OpsProduct;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * IProductDetailService
 * 产品详情表服务类
 *
 * @author 49030
 * @date 2019/8/15
 */

public interface IProductDetailService extends IService<OpsProduct> {

    /**
     * 分页查询所有产品
     *
     * @param page
     * @param detail
     * @return
     */
    IPage<OpsProductDTO> queryProductDetail(Page page, OpsProductDTO detail);

    /**
     * 新增服务
     *
     * @param dto
     * @return
     */
    boolean saveDto(OpsProductDTO dto);

    /**
     * 上传图片
     *
     * @param file
     * @param request
     * @return
     */
    String uploadImg(MultipartFile file, HttpServletRequest request);
}
