<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.RentCarDAO" %>
<%@ page import="db.CarListBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
  <jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<%
  String id = (String) session.getAttribute("id");

  if (id == null) {
%>
<script !src="">
  alert("로그인 후 예약이 가능합니다.");
  location.href = "RentCarMain.jsp?center=MemberLogin.jsp"
</script>
<%
  }

  // 날짜 비교
  Date d1 = new Date();
  Date d2 = new Date();
  // 날짜를 2016-4-4 포맷 해주는 클래스 선언
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  d1 = sdf.parse(rbean.getRentaldate());
  d2 = sdf.parse(sdf.format(d2));

  // 날짜 비교 메소드 사용
  int compare = d1.compareTo(d2);
  // 예약하려는 날짜보다 현재 날짜가 크다면 -1, 같다면 0, 예약하려는 날짜가 더 크면 1
  if (compare < 0) {// 오늘보다 이전 날짜 선택시
%>
<script !src="">
  alert("오늘 날짜보다 이전 날짜는 선택할 수 없습니다.");
  history.go(-1)
</script>
<%
  }
  // 결과적으로 문제가 없다면 저장 후 결과 페이지에 보여주기
  // id 값이 빈클래서에 없기에
  String userId = (String)session.getAttribute("id");
  rbean.setId(userId);

  RentCarDAO rdao = new RentCarDAO();

  // 차량 정보 얻어오기
  CarListBean cbean = rdao.getOneCar(rbean.getNo());
  // 차량 수
  int NoC = Integer.parseInt(rbean.getQty());
  // 총 대여일
  int ResDay = Integer.parseInt(rbean.getLendingday());
  int ResPeriod = 0;
  if (rbean.getLendingperiod() == 1) ResPeriod = 1;
  else if(rbean.getLendingperiod() == 2) ResPeriod = 7;
  else if(rbean.getLendingperiod() == 3) ResPeriod = 30;
  int totalRentalDay = ResDay * ResPeriod;

  int totalCar = cbean.getPrice() * NoC * totalRentalDay;
  // 옵션 추가 후 금액
  int useInsurance = 0;
  if (rbean.getInsurance() == 2) useInsurance = 10000;
  int useWifi = 0;
  if (rbean.getWifi() == 2) useWifi = 10000;
  int useBabysheet = 0;
  if (rbean.getBabysheet() == 2) useBabysheet = 10000;

  int totalOption = NoC * totalRentalDay * (useInsurance + useWifi + useBabysheet);
  int totalPrice = totalCar + totalOption;

  rbean.setTotalPrice(totalPrice);

  rdao.setReserveCar(rbean);
%>
<table width="1100">
  <tr height="120">
    <td align="center" colspan="2">
      <font size="6" color="gray">예약 정보 확인</font>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="img/<%=cbean.getImg()%>" alt="" width="450">
    </td>
  </tr>
  <tr height="50">
    <td align="center">
      <font size="5" color="#a52a2a">차량 예약 총 금액: <%=totalCar%> 원</font>
    </td>
  </tr>
  <tr height="50">
    <td align="center">
      <font size="5" color="#a52a2a">추가 옵션 금액: <%=totalOption%> 원</font>
    </td>
  </tr>
  <tr height="50">
    <td align="center">
      <font size="5" color="#a52a2a">총 금액: <%=totalPrice%> 원</font>
    </td>
  </tr>
</table>