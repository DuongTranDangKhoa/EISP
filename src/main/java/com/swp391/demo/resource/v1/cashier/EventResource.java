/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.cashier;

import com.swp391.demo.dao.EventDAO;
import com.swp391.demo.dto.ErrorDTO;
import com.swp391.demo.dto.EventDTO;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/cashier/event")
public class EventResource {

    private EventDAO dao = EventDAO.getInstance();
    

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllEvent() throws SQLException {

        dao.getAllEvent();
        List<EventDTO> list = dao.getListEvent();
        if (list == null) {
            return Response.ok(new ErrorDTO("Not event has exsited")).build();
        }
        return Response.ok(list).build();
    }
}
