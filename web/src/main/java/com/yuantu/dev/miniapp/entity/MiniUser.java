package com.yuantu.dev.miniapp.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Accessors(chain = true)
@TableName("mini_user")
public class MiniUser implements Serializable {

    @ApiModelProperty(value = "用户唯一标识（小程序）")
    @TableId(type = IdType.INPUT)
    private String openid;

    @ApiModelProperty(value = "用户表ID")
    private Long userid;

    @ApiModelProperty(value = "同一个微信开放平台帐号，用户的unionid是唯一的")
    private String unionid;

    @ApiModelProperty(value = "会话密钥")
    private String sessionKey;

    @ApiModelProperty(value = "随机盐")
    private String salt;

    @ApiModelProperty(value = "加密后的userToken")
    private String token;

    @ApiModelProperty(value = "用户昵称")
    private String nickName;

    @ApiModelProperty(value = "用户的性别，值为1时是男性，值为2时是女性，值为0时是未知")
    private Integer gender;

    @ApiModelProperty(value = "用户所在城市")
    private String city;

    @ApiModelProperty(value = "用户所在省份")
    private String province;

    @ApiModelProperty(value = "用户所在国家")
    private String country;

    @ApiModelProperty(value = "用户的语言，简体中文为zh_CN")
    private String language;

    @ApiModelProperty(value = "用户头像")
    private String avatarUrl;
}
