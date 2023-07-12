/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.config;

import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerResponseContext;
import jakarta.ws.rs.container.ContainerResponseFilter;
import jakarta.ws.rs.ext.Provider;
import java.io.IOException;
 

/**
 *
 * @author lnhtr
 */

@Provider
public class CORSFilter implements ContainerResponseFilter{
    @Override
  public void filter(ContainerRequestContext request, ContainerResponseContext response) throws IOException {
    response.getHeaders().add("Access-Control-Allow-Origin", "*");
    response.getHeaders().add("Access-Control-Allow-Headers", "origin, content-type, accept, authorization");
    response.getHeaders().add("Access-Control-Allow-Credentials", "true");
    response.getHeaders().add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");
  }
}
