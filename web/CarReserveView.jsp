<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="db.CarViewBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = (String) session.getAttribute("id");

  if (id == null) {
%>
<script !src="">
  alert("로그인을 먼저 해주세요")
  location.href = 'RentCarMain.jsp?center=MemberLogin.jsp';
</script>
<%
  }
  // 로그인되어있는 아이디를 읽어옴
  RentCarDAO rdao = new RentCarDAO();
  Vector<CarViewBean> v = rdao.getAllReserve(id);
%>
<table width="1100">
  <tr height="120">
    <td align="center" colspan="12">
      <font size="6" color="gray">예약 정보 확인</font>
    </td>
  </tr>
</table>
<table border="1" bordercolor="#a52a2a">
  <tr height="40">
    <td width="150" align="center">이미지</td>
    <td width="100" align="center">차량명</td>
    <td width="100" align="center">총 금액</td>
    <td width="130" align="center">대여일</td>
    <td width="80" align="center">대여기간</td>
    <td width="80" align="center">수량</td>
    <td width="100" align="center">보험</td>
    <td width="100" align="center">WIFI</td>
    <td width="100" align="center">네비게이션</td>
    <td width="100" align="center">베이비시트</td>
    <td width="80" align="center">수정</td>
    <td width="80" align="center">삭제</td>
  </tr>
  <%
    for (int i = 0; i < v.size(); i++) {
      CarViewBean bean = v.get(i);
      String rentalPeriod = null;
      if (bean.getLendingperiod() == 1) rentalPeriod = "일";
      else if (bean.getLendingperiod() == 2) rentalPeriod = "주";
      else if (bean.getLendingperiod() == 3) rentalPeriod = "개월";

      String useIn = null;
      if (bean.getInsurance() == 2) useIn = "적용";
      else useIn = "비적용";
      String useWifi = null;
      if (bean.getWifi() == 2) useWifi = "적용";
      else useWifi = "비적용";
      String useNav = null;
      if (bean.getNavigation() == 2) useNav = "적용";
      else useNav = "비적용";
      String useBS = null;
      if (bean.getBabysheet() == 2) useBS = "적용";
      else useBS = "비적용";
  %>
  <tr height="70">
    <td width="150" align="center"><img src="img/<%=bean.getImg()%>" alt="" width="120" height="70" /></td>
    <td width="100" align="center"><%=bean.getName()%></td>
    <td width="100" align="center"><%=bean.getTotalPrice()%>원</td>
    <td width="130" align="center"><%=bean.getRentaldate()%></td>
    <td width="80" align="center"><%=bean.getLendingday()%><%=rentalPeriod%></td>
    <td width="80" align="center"><%=bean.getQty()%>대</td>
    <td width="100" align="center"><%=useIn%></td>
    <td width="100" align="center"><%=useWifi%></td>
    <td width="100" align="center"><%=useNav%></td>
    <td width="100" align="center"><%=useBS%></td>
    <td width="80" align="center"><button>수정</button></td>
    <td width="80" align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rentaldate=<%=bean.getRentaldate()%>'">삭제</button></td>
  </tr>
  <%
    }
  %>
</table>