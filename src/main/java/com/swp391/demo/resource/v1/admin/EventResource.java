/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.admin;

import com.swp391.demo.dao.EventDAO;
import com.swp391.demo.dto.ErrorDTO;
import com.swp391.demo.dto.EventDTO;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/admin/event")
public class EventResource {

    private EventDAO dao = EventDAO.getInstance();
    private Date date;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createEvent(EventDTO dto) throws SQLException {
        long millis = System.currentTimeMillis();
        date = new java.sql.Date(millis);
        System.out.println(date);
        
        
      
        if (dto.getBeginDate().before(date)) {
            return Response.ok(new ErrorDTO("Date not vaild")).build();
        }
        if (dto.getEndDate().before(dto.getBeginDate())) {
            return Response.ok(new ErrorDTO("Date not vaild")).build();
        }
        boolean result = dao.createEvent(dto);
        if (result) {
            return Response.status(Response.Status.CREATED).build();

        }
        return Response.status(406, "Event can not create").build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllEvent() throws SQLException {

        dao.getAllEvent();
        List<EventDTO> list = dao.getListEvent();
        if (list.isEmpty()) {
            return Response.status(200).build();
        }
        return Response.ok(list).build();
    }

    @Path("update")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateEvent(EventDTO dto) throws SQLException {
        long millis = System.currentTimeMillis();
        date = new java.sql.Date(millis);

        if (dto.getBeginDate().before(date)) {
            return Response.ok(new ErrorDTO("Date not vaild")).build();
        }
        if (dto.getEndDate().before(dto.getBeginDate())) {
            return Response.ok(new ErrorDTO("Date not vaild")).build();
        }
        boolean result = dao.updateEvent(dto);
        if (result) {
            return Response.status(Response.Status.ACCEPTED).build();
        }
        return Response.status(406, "Fail to update Event").build();
    }

}
