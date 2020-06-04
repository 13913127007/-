package com.yuantu.dev.business.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.Assert;
import com.baomidou.mybatisplus.extension.api.R;
import com.yuantu.dev.business.dto.OpsProductDTO;
import com.yuantu.dev.business.entity.OpsProduct;
import com.yuantu.dev.business.service.IProductDetailService;
import com.yuantu.dev.core.web.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * ProductDetailController
 * 产品详情表 前端控制器
 *
 * @author 49030
 * @date 2019/8/15
 */
@Api(tags = {"产品详情"})
@RestController
@RequestMapping("/productDetail")
public class ProductDetailController extends BaseController<IProductDetailService, OpsProduct> {

    @Value("${upload-dir}")
    private String uploadPath;

    @ApiOperation(value = "分页查询所有产品")
    @GetMapping("/page")
    public R<IPage<OpsProductDTO>> page(OpsProductDTO detail) {
        return success(baseService.queryProductDetail(getPage(), detail));
    }

    @ApiOperation(value = "新增产品")
    @GetMapping("/saveDto")
    public R<Boolean> saveDTO(OpsProductDTO dto) {
        return success(baseService.saveDto(dto));
    }

    @ApiOperation(value = "上传图片，返回图片地址")
    @PostMapping("/upload2")
    public String upload2(@RequestParam("file") MultipartFile files, HttpServletRequest request) throws IOException {
        if (files == null) {
            Assert.fail("您未选择任何文件");
        }
        return baseService.uploadImg(files, request);
    }
}
