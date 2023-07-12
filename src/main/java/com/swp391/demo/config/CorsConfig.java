/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
package com.swp391.demo.config;

//import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
/**
 *
 * @author lnhtr
 */

@Configuration
public class CorsConfig implements WebMvcConfigurer{
    @Override
<<<<<<< HEAD
    public void addCorsMappings (CorsRegistry registry){
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true)
                .maxAge(3600);
=======
    public void addCorsMappings (CorsRegistry resgitry){
        resgitry.addMapping("/**")
                .allowedMethods("GET", "POST")
                .allowedOriginPatterns("*")
                .allowedOrigins("*")
                .exposedHeaders("Access-Control-Allow-Origin", "Access-Control-Allow-Credentials");
                
>>>>>>> 802c1a1201f22e46f7623b28c46c86f5d4b78cab
    } 
}
