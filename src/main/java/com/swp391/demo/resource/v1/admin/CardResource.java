/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.admin;

import com.swp391.demo.dao.CardDAO;
import com.swp391.demo.dto.CardDTO;
import com.swp391.demo.dto.ErrorDTO;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/admin/card")
public class CardResource {

    private CardDAO dao = CardDAO.getInstance();

    @Path("create")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createCard(CardDTO dto) throws SQLException {
        int idCheck = dao.checkCardId();
        boolean result = dao.CreateCard(dto, idCheck);
        if (result == true) {
            return Response.status(Response.Status.CREATED).build();
        }
        return Response.status(Response.Status.NOT_ACCEPTABLE).build();
    }

    @Path("create50")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response create50Card(CardDTO dto) throws SQLException {
        for (int i = 0; i < 50; i++) {
            int idCheck = dao.checkCardId();
            boolean result = dao.CreateCard(dto, idCheck);
            if (result == false) {
                return Response.status(406, "Fail to Create Create Card").build();
            }
        }
        return Response.status(Response.Status.CREATED).build();
    }

    @Path("{eventId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCardInEvent(@PathParam("eventId") int eventId) throws SQLException {
        dao.getAllCard(eventId);
        List<CardDTO> list = dao.getListCard();
        if (list != null) {

            return Response.ok(list).build();
        }
        return Response.status(200).build();
    }

    @Path("update")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response upateCard(CardDTO dto) throws SQLException {
        boolean result = dao.updateCardAdmin(dto);
        if (result) {
            return Response.ok(dao.getInfoCard(dto.getId())).build();
        }
        return Response.ok(new ErrorDTO("Update card fail")).build();

    }
}
