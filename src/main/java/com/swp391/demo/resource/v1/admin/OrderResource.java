/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.admin;

import com.swp391.demo.dao.OrderDAO;
import com.swp391.demo.dto.ErrorDTO;
import com.swp391.demo.dto.OrderDTO;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/admin/order")
public class OrderResource {

    private OrderDAO dao = OrderDAO.getInstance();

    @Path("{eventId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getListOrder(@PathParam("eventId") int id) {
        dao.getListOrderEvent();
        List<OrderDTO> list = dao.getListOrderEvent();
        if (list == null) {
            return Response.ok(new ErrorDTO("No Order has existed")).build();
        }
        return Response.ok(list).build();
   
        
    }
}
