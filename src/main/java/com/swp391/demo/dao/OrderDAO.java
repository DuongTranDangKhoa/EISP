/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.dao;

import com.swp391.demo.dto.OrderCheckDTO;
import com.swp391.demo.dto.OrderDTO;
import com.swp391.demo.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lnhtr
 */
public class OrderDAO implements Serializable {

    private Connection con = DBUtil.makeConnection();
    private static OrderDAO instance;
    private List<OrderDTO> listOrder;
    private List<OrderDTO> listOrderEvent;

    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    public List<OrderDTO> getListOrder() {
        return listOrder;
    }

    public List<OrderDTO> getListOrderEvent() {
        return listOrderEvent;
    }

    public int checkOrderId() throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;

        int id = 0;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select Id "
                        + " From [Order] "
                        + " Where Id = ?";
                do {
                    stm = con.prepareStatement(sql);
                    id = (int) (Math.random() * 1000000);
                    stm.setInt(1, id);
                    rs = stm.executeQuery();
                    if (rs.next() == false) {
                        break;
                    }

                } while (true);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return id;
    }

    public boolean createOrder(OrderCheckDTO dto, int id) throws SQLException {
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Insert into [Order] "
                        + "(Id, Date, ShopId, CardId, Total ) "
                        + "Values (?,CURRENT_TIMESTAMP,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, dto.getShopId());
                stm.setInt(3, dto.getCardId());
                stm.setDouble(4, dto.getTotal());
                int i = stm.executeUpdate();
                if (i > 0) {
                    result = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public OrderDTO viewRevenue(OrderDTO dto) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        OrderDTO result = null;
        String begin = dto.getBeginDate() + " 00:00:00:000";
        String end = dto.getEndDate() + " 23:59:59:999";
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select ShopId, Sum(Total) as Revenue From [Order] "
                        + " Where ShopId = ? "
                        + " and Date  between ? and ? "
                        + " Group by ShopID";
                stm = con.prepareStatement(sql);

                stm.setString(1, dto.getShopId());
                stm.setString(2, begin);
                stm.setString(3, end);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String shopId = rs.getString("ShopId");
                    Double revenue = rs.getDouble("Revenue");
                    result = new OrderDTO(0, shopId, 0, dto.getBeginDate(), dto.getEndDate(), revenue);

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public void listOrderInShop(String key) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        listOrder = null;

        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select * From [Order] "
                        + " Where ShopId = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, key);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("Id");
                    String shopId = rs.getString("ShopId");
                    int cardId = rs.getInt("CardId");
                    Date date = rs.getDate("Date");
                    Double total = rs.getDouble("Total");
                    OrderDTO dto = new OrderDTO(id, shopId, cardId, date, null, total);
                    if (listOrder == null) {
                        listOrder = new ArrayList<>();
                    }
                    listOrder.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void listOrderInEvent(int key) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        listOrderEvent = null;

        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select o.No, o.Id, o.[Date], o.ShopId, o.CardId, o.Total From [Order] o, Event e, Shop s "
                        + " Where e.Id =  s.EventId "
                        + " and o.ShopId = s.Id "
                        + " and e.Id = ? "
                        + " Order by o.No";

                stm = con.prepareStatement(sql);
                stm.setInt(1, key);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("Id");
                    String shopId = rs.getString("ShopId");
                    int cardId = rs.getInt("CardId");
                    Date date = rs.getDate("Date");
                    Double total = rs.getDouble("Total");
                    OrderDTO dto = new OrderDTO(id, shopId, cardId, date, null, total);
                    if (listOrderEvent == null) {
                        listOrderEvent = new ArrayList<>();
                    }
                    listOrderEvent.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int getCard(int key) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int cardId = 0;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select CardId From [Order] "
                        + " Where Id = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, key);
                rs = stm.executeQuery();
                if (rs.next()) {
                    cardId = rs.getInt("CardId");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return cardId;
    }
}
