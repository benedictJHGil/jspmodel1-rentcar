<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
  <%--세션을 이용한 로그인 처리--%>
  <%
    String id = (String) session.getAttribute("id");

    // 로그인이 되어있지 않다면
    if (id == null) {
      id = "GUEST";
    }
  %>
  <center>
    <table width="1100">
      <tr height="70">
        <td colspan="3">
          <a href="RentCarMain.jsp"><img src="img/RENT.png" alt="" height="65" /></a>
        </td>
        <td align="right" width="200" colspan="2">
          <%=id%> 님 반갑습니다. &nbsp;&nbsp;
          <%
            if (id.equals("GUEST")) {
          %>
          <button onclick="location.href='RentCarMain.jsp?center=MemberLogin.jsp'">로그인</button>
          <%
          } else {
          %>
          <button onclick="location.href='MemberLogout.jsp'">로그아웃</button>
          <%
            }
          %>
        </td>
      </tr>
      <tr height="50">
        <td align="center" width="200" bgcolor="#a52a2a">
          <a href="RentCarMain.jsp?center=CarReserveMain.jsp" style="text-decoration: none"><font color="white" size="4">예 약 하 기</font></a>
        </td>
        <td align="center" width="200" bgcolor="#a52a2a">
          <a href="RentCarMain.jsp?center=CarReserveView.jsp" style="text-decoration: none"><font color="white" size="4">예 약 확 인</font></a>
        </td>
        <td align="center" width="200" bgcolor="#a52a2a">
          <a href="#" style="text-decoration: none"><font color="white" size="4">자 유 게 시 판</font></a>
        </td>
        <td align="center" width="200" bgcolor="#a52a2a">
          <a href="#" style="text-decoration: none"><font color="white" size="4">이 벤 트</font></a>
        </td>
        <td align="center" width="200" bgcolor="#a52a2a">
          <a href="#" style="text-decoration: none"><font color="white" size="4">고 객 센 터</font></a>
        </td>
      </tr>
    </table>
  </center>
</body>
</html>
