package com.yuantu.dev.business.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yuantu.dev.business.dto.OpsProductDTO;
import com.yuantu.dev.business.entity.PriceType;
import com.yuantu.dev.business.entity.OpsProduct;
import com.yuantu.dev.business.mapper.ProductDetailMapper;
import com.yuantu.dev.business.service.IPriceTypeService;
import com.yuantu.dev.business.service.IProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * ProductDetailServiceImpl
 *
 * @author 49030
 * @date 2019/8/15
 */
@Service
public class ProductDetailServiceImpl extends ServiceImpl<ProductDetailMapper, OpsProduct> implements IProductDetailService {

    @Value("${upload-dir}")
    private String uploadPath;

    @Autowired
    IPriceTypeService priceTypeService;

    @Override
    public IPage<OpsProductDTO> queryProductDetail(Page page, OpsProductDTO detail) {
        return page.setRecords(this.baseMapper.queryProductDetail(page, detail));
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public boolean saveDto(OpsProductDTO dto) {
        OpsProduct pd = dto.convert(OpsProduct.class);
        boolean productDetailSaveFlag = this.save(pd);
        Long productDetailId = pd.getId();
        // 价格类型表存入数据
        PriceType priceType = new PriceType();
        priceType.setProductDetailId(productDetailId);
        priceType.setCommonlyPrice(dto.getCommonlyPrice());
        priceType.setWeekendPrice(dto.getWeekendPrice());
        priceType.setHolidayPrice(dto.getHolidayPrice());
        boolean priceTypeFlag = priceTypeService.save(priceType);
        // 产品折扣表存入数据

        return productDetailSaveFlag && priceTypeFlag;
    }

    @Override
    public String uploadImg(MultipartFile file, HttpServletRequest request) {
        String filePathName = null;
        String path = "";
        String type = null;
        // 文件原名称
        String fileName = file.getOriginalFilename();
        // 判断文件类型
        type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
        if (type != null) {
            if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
                String localPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
                String realPath = request.getSession().getServletContext().getRealPath(uploadPath);
                String trueFileName = "helper" + "." + type;
                path = realPath + trueFileName;
                try {
                    file.transferTo(new File(path));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                filePathName = localPath + "/file/" + trueFileName;
            } else {
                return "文件格式不支持";
            }
        }
        return filePathName;
    }
}
