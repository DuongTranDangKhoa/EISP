/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.general;

import com.swp391.demo.dao.AccountDAO;
import com.swp391.demo.dao.CardDAO;
import com.swp391.demo.dao.ImageEventDAO;
import com.swp391.demo.dao.OrderDAO;
import com.swp391.demo.dao.ProductDAO;
import com.swp391.demo.dto.AccountDTO;
import com.swp391.demo.dto.CardDTO;
import com.swp391.demo.dto.ErrorDTO;
import com.swp391.demo.dto.ImageEventDTO;
import com.swp391.demo.dto.OrderDTO;
import com.swp391.demo.dto.ProductDTO;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/general")
public class GeneralResource {

    private AccountDAO dao = AccountDAO.getInstance();
    private CardDAO dao1 = CardDAO.getInstance();
    private OrderDAO dao2 = OrderDAO.getInstance();
    private ProductDAO dao3 = ProductDAO.getInstance();
    private ImageEventDAO dao4 = ImageEventDAO.getInstance();
    private List<ProductDTO> list = new ArrayList<>();


    @Path("login")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response checkLogin(AccountDTO dto) throws SQLException, URISyntaxException {
        AccountDTO x = dao.checkLogin(dto);
        if (x == null) {
            return Response.status(500).build();
        }
        return Response.accepted(x).build();
    }

    @Path("cardInfo")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response searchCard(CardDTO dto) throws SQLException {
        CardDTO x = dao1.getInfoCard(dto.getId());

        if (x == null) {
            return Response.status(200," ").build();
        }
        return Response.accepted(x).build();
    }

    @Path("viewRevenue")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response viewRevenue(OrderDTO dto) throws SQLException {
        OrderDTO x = dao2.viewRevenue(dto);
        if (x != null) {
            return Response.accepted(x).build();

        }
        return Response.ok(new OrderDTO(0, dto.getShopId(), 0, dto.getBeginDate(), dto.getEndDate(), 0)).build();

    }

    @Path("{shopId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProduct(@PathParam("shopId") String shopId) throws SQLException {
        dao3.getSaleProductShop(shopId);
        List<ProductDTO> list = dao3.getProductSaleList();

        return Response.ok(list).build();
    }
    
    @Path("img/{eventId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getImage(@PathParam("eventId") int id) throws SQLException {
        dao4.listImage(id);
        List<ImageEventDTO> list = dao4.getImageList();
        if (list == null) {
            return Response.status(200, "Event' image has not exist").build();
        }
        return Response.ok(list).build();
    }
    
    @Path("order/{shopId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getListOrder(@PathParam("shopId") String id) throws SQLException{
        dao2.listOrderInShop(id);
        List<OrderDTO> list = dao2.getListOrder();
        if (list == null) {
            return Response.ok(new ErrorDTO("No Order has existed")).build();
        }
        return Response.ok(list).build();
    }
            
}
