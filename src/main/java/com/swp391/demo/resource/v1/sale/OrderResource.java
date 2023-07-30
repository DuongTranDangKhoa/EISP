/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.resource.v1.sale;

import com.swp391.demo.dao.CardDAO;
import com.swp391.demo.dao.ComboDAO;
import com.swp391.demo.dao.OrderDAO;
import com.swp391.demo.dao.OrderDetailDAO;
import com.swp391.demo.dao.ProductDAO;
import com.swp391.demo.dao.TransactionDAO;
import com.swp391.demo.dto.ComboDTO;
import com.swp391.demo.dto.NoDTO;
import com.swp391.demo.dto.OrderCheckDTO;
import com.swp391.demo.dto.OrderDTO;
import com.swp391.demo.dto.OrderDetailCheckDTO;
import com.swp391.demo.dto.OrderDetailDTO;
import com.swp391.demo.dto.ProductDTO;
import com.swp391.demo.dto.TransactionDTO;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lnhtr
 */
@Path("v1/sale")
public class OrderResource {

    private OrderDAO dao = OrderDAO.getInstance();
    private OrderDetailDAO dao1 = OrderDetailDAO.getInstance();
    private ProductDAO dao2 = ProductDAO.getInstance();
    private ComboDAO dao3 = ComboDAO.getInstance();
    private CardDAO dao4 = CardDAO.getInstance();
    private TransactionDAO dao5 = TransactionDAO.getInstance();

    @Path("order")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response orderListProduct(List<OrderCheckDTO> list) throws SQLException {
//        dao2.getProductShop(list.get(0).getShopId());
//        List<ProductDTO> pl = dao2.getProductList();
        int id = dao.checkOrderId();

        boolean result2 = dao4.withdraw(list.get(0).getCardId(),
                dao4.getbalance(list.get(0).getCardId()) - list.get(0).getTotal());
        if (!result2) {
            return Response.status(406, "Not enought money").build();
        }

        boolean result = dao.createOrder(list.get(0), id);
        if (!result) {
            return Response.status(406, "Can not Create Order").build();
        }

        TransactionDTO t = new TransactionDTO(list.get(0).getCardId(), id);
        boolean result1 = dao5.createTransaction(t);
        if (!result1) {
            return Response.status(406, "Can not Create Transaction").build();
        }

        for (int i = 1; i < list.size(); i++) {
//            if (list.get(i).getCategory().equals("Combo")) {
//                dao3.getInfoCombo(list.get(i).getProductId());
//                List<ComboDTO> cb = dao3.getListCombo();
//                for (int j = 0; j < cb.size(); j++) {
//                    OrderDetailDTO dto = new OrderDetailDTO(id,
//                            cb.get(j).getIdMake(),
//                            list.get(i).getQuantity() * cb.get(j).getQuantity(),
//                            dao2.getPrice(cb.get(j).getIdMake()),
//                            0);
//                    boolean x = dao1.createDetail(dto);
//                    if (x == false) {
//                        return Response.status(406, "Fail when insetrt orderdetail Combo").build();
//                    }
//                }
//            } else {
//                OrderDetailDTO dto = new OrderDetailDTO(id,
//                        list.get(i).getProductId(),
//                        list.get(i).getQuantity(),
//                        dao2.getPrice(list.get(i).getProductId()),
//                        0);
//                boolean x = dao1.createDetail(dto);
//                if (x == false) {
//                    return Response.status(406, "Fail when insetrt orderdetail Product").build();
//                }
//            }
            OrderDetailDTO dto = new OrderDetailDTO(id,
                    list.get(i).getProductId(),
                    list.get(i).getQuantity(),
                    dao2.getPrice(list.get(i).getProductId()),
                    0);
            boolean x = dao1.createDetail(dto);
            if (x == false) {
                return Response.status(406, "Fail when insetrt orderdetail Product").build();
            }
        }
        return Response.status(Response.Status.ACCEPTED).build();
    }

    @Path("checkProductSold/{shopId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response checkProductSold(@PathParam("shopId") String shopId) throws SQLException {
        dao2.getAllProductShop(shopId);
        List<ProductDTO> productList = dao2.getAllProductList();

        dao1.viewQuatityProduct(shopId);
        List<OrderDetailDTO> productSoldList = dao1.getListProductSold();
        List<OrderDetailCheckDTO> list = new ArrayList<>();

        if (productSoldList != null) {
            for (OrderDetailDTO x : productSoldList) {
                for (ProductDTO i : productList) {
                    if (x.getProductId() == i.getId()) {
                        OrderDetailCheckDTO dto = new OrderDetailCheckDTO(x.getProductId(), i.getShopId(), i.getName(), i.getImg(), i.getDescription(), i.getCategory(), x.getQuantity());
                        if (dto.getCategory().equals("Combo")) {
                            dao3.getInfoCombo(dto.getProductId());
                            List<ComboDTO> cb = dao3.getListCombo();
                            for (int j = 0; j < cb.size(); j++) {
                                ProductDTO c = dao2.getProduct(cb.get(j).getIdMake());
                                OrderDetailCheckDTO dto1 = new OrderDetailCheckDTO(c.getId(),
                                        i.getShopId(),
                                        c.getName(),
                                        c.getImg(),
                                        c.getDescription(),
                                        c.getCategory(),
                                        x.getQuantity() * cb.get(j).getQuantity());
                                list.add(dto1);
                            }
                            break;
                        } else {
                            list.add(dto);
                            break;
                        }
                    }
                }
            }

        }
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).getProductId() == list.get(j).getProductId()) {
                    list.get(i).setQuantity(list.get(i).getQuantity() + list.get(j).getQuantity());
                    list.remove(list.get(j));
                }
            }
        }
        return Response.ok().build();
    }

    @Path("infoOrder")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getInforOrder(OrderDTO dto) throws SQLException {
        dao1.getInfoOrder(dto.getId());
        List<OrderDetailDTO> od = dao1.getListInfoOrder();
        dao2.getAllProductShop(dto.getShopId());
        List<ProductDTO> pd = dao2.getAllProductList();
        List<OrderCheckDTO> list = new ArrayList<>();

        int id = dao.getCard(dto.getId());
        for (OrderDetailDTO x : od) {
            for (ProductDTO i : pd) {
                if (x.getProductId() == i.getId()) {
                    OrderCheckDTO check = new OrderCheckDTO(dto.getShopId(),
                            id,
                            0,
                            i.getId(),
                            x.getQuantity(),
                            0,
                            i.getDescription());
                    list.add(check);
                    break;
                }
            }
        }
        
        for (int i = 0; i < list.size()-1; i++) {
            List<NoDTO> index = new ArrayList<>();
            for (int j = i+1; j < list.size(); j++) {
                if (list.get(i).getProductId() == list.get(j).getProductId()) {
                    list.get(i).setQuantity(list.get(i).getQuantity() + list.get(j).getQuantity());
                    index.add(new NoDTO(j));
                }
            }
            for (int j = index.size()-1; j >= 0; j--) {
                list.remove(index.get(j).getNo());
            }
        }

        return Response.ok(list).build();
    }
}

