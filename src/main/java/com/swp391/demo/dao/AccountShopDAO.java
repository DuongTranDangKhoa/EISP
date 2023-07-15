/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.swp391.demo.dao;

import com.swp391.demo.dto.AccountShopDTO;
import com.swp391.demo.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lnhtr
 */
public class AccountShopDAO implements Serializable {

    private static AccountShopDAO instance;
    private Connection con = DBUtil.makeConnection();
    private List<AccountShopDTO> listAccountShop;

    public List<AccountShopDTO> getListAccountShop() {
        return listAccountShop;
    }
    
    

    public static AccountShopDAO getInstance() {
        if (instance == null) {
            instance = new AccountShopDAO();
        }
        return instance;
    }

    public boolean setStatus(AccountShopDTO dto) throws SQLException {
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Update AccountShop "
                        + " Set Status = ? "
                        + "  Where Username = ? And ShopId = ?";
                stm = con.prepareStatement(sql);
                stm.setBoolean(1, dto.isStatus());
                stm.setString(2, dto.getUsername());
                stm.setString(3, dto.getShopId());
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

    public boolean checkStatusExist(String username) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select * From AccountShop "
                        + " Where Username = ? and Status  = 'true'";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
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

    public boolean setAcccountShop(AccountShopDTO dto) throws SQLException {
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Insert into AccountShop(Username, ShopId) "
                        + " values(?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getShopId());

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
    
    public void getInfoAccountShop() throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        listAccountShop = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select * From AccountShop "
                        + "  Where Status  = 'true'";
                stm = con.prepareStatement(sql);
                
                rs = stm.executeQuery();
                if (rs.next()) {
                    String username = rs.getString("Username");
                    String shopId = rs.getString("ShopId");
                    boolean status = rs.getBoolean("Status");
                    AccountShopDTO dto = new AccountShopDTO(username, shopId, status);
                    if (listAccountShop == null) {
                        listAccountShop = new ArrayList<>();
                    }
                    listAccountShop.add(dto);
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
}
