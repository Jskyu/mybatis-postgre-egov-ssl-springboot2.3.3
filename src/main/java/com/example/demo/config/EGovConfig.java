package com.example.demo.config;

import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.cmmn.trace.handler.DefaultTraceHandler;
import egovframework.rte.fdl.cmmn.trace.handler.TraceHandler;
import egovframework.rte.fdl.cmmn.trace.manager.DefaultTraceHandleManager;
import egovframework.rte.fdl.cmmn.trace.manager.TraceHandlerService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

/**
 * @class EGovConfig
 * 설명 : 전자정부프레임워크를 설정하기 위한 Configuration class 이다.
 */
@Configuration
@ComponentScan(
        //베이스 패키지 명시
        basePackages="egovframework",
        //Service 와 Repository 필터링
        includeFilters={
                @ComponentScan.Filter(type=FilterType.ANNOTATION,
                        value= Service.class)
                , @ComponentScan.Filter(type=FilterType.ANNOTATION, value= Repository.class)
        },
        //Controller 와 Configuration 필터링 제외
        excludeFilters={
                @ComponentScan.Filter(type=FilterType.ANNOTATION, value= Controller.class)
                , @ComponentScan.Filter(type=FilterType.ANNOTATION, value= Configuration.class)
        }
)
public class EGovConfig {

    //AntPathMatcher Bean 등록
    @Bean
    public AntPathMatcher antPathMater(){
        return new AntPathMatcher();
    }

    //DefaultTraceHandler Bean 등록
    @Bean
    public DefaultTraceHandler defaultTraceHandler(){
        return new DefaultTraceHandler();
    }

    //DefaultTraceHandleManager 설정 및 Bean 등록
    @Bean
    public DefaultTraceHandleManager traceHandlerService(AntPathMatcher antPathMater, DefaultTraceHandler defaultTraceHandler){
        DefaultTraceHandleManager defaultTraceHandleManager = new DefaultTraceHandleManager();
        defaultTraceHandleManager.setReqExpMatcher(antPathMater);
        //모든 패턴 세팅
        defaultTraceHandleManager.setPatterns(new String[]{"*"});
        //TraceHandler 타입으로 defaultTraceHandler 세팅
        defaultTraceHandleManager.setHandlers(new TraceHandler[]{defaultTraceHandler});
        return defaultTraceHandleManager;
    }

    //LeaveaTrace 설정 및 Bean 등록
    @Bean
    public LeaveaTrace leaveaTrace(DefaultTraceHandleManager traceHandlerService){
        LeaveaTrace leaveaTrace = new LeaveaTrace();
        //TraceHandlerService 세팅
        leaveaTrace.setTraceHandlerServices(new TraceHandlerService[]{traceHandlerService});
        return leaveaTrace;
    }

}
