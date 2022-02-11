package com.bootdo.ureport.config;
import com.bstek.ureport.console.UReportServlet;
import org.springframework.boot.autoconfigure.web.WebMvcProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

import javax.servlet.Servlet;


@Configuration
@ImportResource("classpath:context.xml")
public class UreportConfig {
    @Bean
    public ServletRegistrationBean buildUreportServlet(){
        return new ServletRegistrationBean(new UReportServlet(), "/ureport/*");
    }
}
