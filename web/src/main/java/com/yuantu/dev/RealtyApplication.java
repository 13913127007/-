package com.yuantu.dev;

import com.yuantu.dev.common.spring.SpringHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {
        "com.yuantu.dev.config",
        "com.yuantu.dev.*.controller",
        "com.yuantu.dev.*.service",
        "com.yuantu.dev.core.web"})
public class RealtyApplication extends SpringBootServletInitializer {
    private static final Logger logger = LoggerFactory.getLogger(RealtyApplication.class);

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(RealtyApplication.class);
        application.setBannerMode(Banner.Mode.CONSOLE);
        SpringHelper.setApplicationContext(application.run(args));
        if (logger.isInfoEnabled()) {
            System.out.println("入口：http://localhost:8080");
            System.out.println("文档：http://localhost:8088/swagger-ui.html");
        }
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(RealtyApplication.class);
    }
}
