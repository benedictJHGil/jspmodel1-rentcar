package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class RentCarDAO {

    Connection con = null;
    PreparedStatement pstmt = null;
    DataSource ds = null;
    ResultSet rs = null;

    // 커넥션 풀을 이용한 DB 연결
    public void getCon() {
        try {
            Context initctx = new InitialContext();
            Context envctx = (Context) initctx.lookup("java:comp/env");
            ds = (DataSource) envctx.lookup("jdbc/pool");
            con = ds.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
    }

    // 최신순 3대의 자동차를 반환하는 메소드
    public Vector<CarListBean> getSelectCar() {
        Vector<CarListBean> v = new Vector<>();
        try {
            getCon();
            String sql = "select * from rentcar order by no desc";
            pstmt = con.prepareStatement(sql);
            // 쿼리 실행 후 결과를 반환
            rs = pstmt.executeQuery();
            int count = 0;
            while (rs.next()) {
                CarListBean bean = new CarListBean();
                bean.setNo(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setCategory(rs.getInt(3));
                bean.setPrice(rs.getInt(4));
                bean.setUsepeople(rs.getInt(5));
                bean.setCompany(rs.getString(6));
                bean.setImg(rs.getString(7));
                bean.setInfo(rs.getString(8));
                // 벡터에 빈클래스를 저장
                v.add(bean);
                count++;
                if (count > 2)
                    break; // 반복문 빠져나가기
                // 3개만 벡터에 저장
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return v;
    }

    // 카테고리별 자동차 리스트를 저장하는 메소드
    public Vector<CarListBean> getCategoryCar(int category) {
        Vector<CarListBean> v = new Vector<>();
        try {
            getCon();
            String sql = "select * from rentcar where category = ?";
            pstmt = con.prepareStatement(sql);
            // ?
            pstmt.setInt(1, category);
            // 결과 반환
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // 데이터를 저장할 빈클래스 선언
                CarListBean bean = new CarListBean();
                bean.setNo(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setCategory(rs.getInt(3));
                bean.setPrice(rs.getInt(4));
                bean.setUsepeople(rs.getInt(5));
                bean.setCompany(rs.getString(6));
                bean.setImg(rs.getString(7));
                bean.setInfo(rs.getString(8));
                // 벡터에 빈클래스를 저장
                v.add(bean);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return v;
    }

    //
    public Vector<CarListBean> getAllCar() {
        Vector<CarListBean> v = new Vector<>();
        try {
            getCon();
            String sql = "select * from rentcar";
            pstmt = con.prepareStatement(sql);
            // 결과 반환
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // 데이터를 저장할 빈클래스 선언
                CarListBean bean = new CarListBean();
                bean.setNo(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setCategory(rs.getInt(3));
                bean.setPrice(rs.getInt(4));
                bean.setUsepeople(rs.getInt(5));
                bean.setCompany(rs.getString(6));
                bean.setImg(rs.getString(7));
                bean.setInfo(rs.getString(8));
                // 벡터에 빈클래스를 저장
                v.add(bean);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return v;
    }

    // 하나의 자동차 정보를 반환하는 메소드
    public CarListBean getOneCar(int no) {
        CarListBean bean = new CarListBean();
        try {
            getCon();
            String sql = "select * from rentcar where no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            // 결과 반환
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bean.setNo(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setCategory(rs.getInt(3));
                bean.setPrice(rs.getInt(4));
                bean.setUsepeople(rs.getInt(5));
                bean.setCompany(rs.getString(6));
                bean.setImg(rs.getString(7));
                bean.setInfo(rs.getString(8));
                // 벡터에 빈클래스를 저장
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bean;
    }

    // 회원 정보가 있는지를 비교
    public int getMember(String id, String pwd) {
        int result = 0; // 0이면 회원 없음
        try {
            getCon();
            String sql = "select count(*) from member where id = ? and pwd1 = ?";
            pstmt = con.prepareStatement(sql);
            // ?
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            // 결과 반환
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1); // 0또는 1값이 저장됨
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 하나의 예약 정보를 저장하는 메소드
    public void setReserveCar(CarReserveBean bean) {
        try {
            getCon();
            String sql = "insert into carreserve values(reserve_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            // ?
            pstmt.setInt(1, bean.getNo());
            pstmt.setString(2, bean.getId());
            pstmt.setString(3, bean.getQty());
            pstmt.setString(4, bean.getLendingday());
            pstmt.setInt(5, bean.getLendingperiod());
            pstmt.setString(6, bean.getRentaldate());
            pstmt.setInt(7, bean.getInsurance());
            pstmt.setInt(8, bean.getWifi());
            pstmt.setInt(9, bean.getNavigation());
            pstmt.setInt(10, bean.getBabysheet());
            pstmt.setInt(11, bean.getTotalPrice());

            pstmt.executeUpdate();

            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 회원의 예약정보를 반환하는 메소드
    public Vector<CarViewBean> getAllReserve(String id) {
        Vector<CarViewBean> v = new Vector<>();
        try {
            getCon();
            String sql = "select * from RENTCAR natural join CARRESERVE where sysdate < to_date(RENTALDATE, 'YYYY-MM-DD') and id = ?";
            pstmt = con.prepareStatement(sql);
            // ?
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CarViewBean bean = new CarViewBean();
                bean.setName(rs.getString("name"));
                bean.setPrice(rs.getInt("price"));
                bean.setImg(rs.getString("img"));
                bean.setQty(rs.getString("qty"));
                bean.setLendingday(rs.getString("lendingday"));
                bean.setLendingperiod(rs.getInt("lendingperiod"));
                bean.setRentaldate(rs.getString("rentaldate"));
                bean.setInsurance(rs.getInt("insurance"));
                bean.setWifi(rs.getInt("wifi"));
                bean.setNavigation(rs.getInt("navigation"));
                bean.setBabysheet(rs.getInt("babysheet"));
                bean.setTotalPrice(rs.getInt("totalprice"));
                v.add(bean);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return v;
    }

    // 하나의 예약 삭제
    public void carRemoveReserve(String id, String rentalDate) {
        try {
            getCon();
            String sql = "delete from carreserve where id = ? and rentaldate = ?";
            pstmt = con.prepareStatement(sql);
            // ?
            pstmt.setString(1, id);
            pstmt.setString(2, rentalDate);
            // 쿼리 실행
            pstmt.executeUpdate();

            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
