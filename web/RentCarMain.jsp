<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>SM Rental</title>
</head>
<body>
  <%
    String center = request.getParameter("center");

    // 처음 실행시에는 center 값이 넘어오지 않기에
    if (center == null) { // null 처리
      center = "Center.jsp"; // 디폴트 center값
    }
  %>
  <center>
    <table width="1100">
      <%--Top 부분--%>
      <tr>
        <td>
          <jsp:include page="Top.jsp" />
        </td>
      </tr>

      <%--Center 부분--%>
      <tr width="1100" align="center" height="550">
        <td align="center">
          <jsp:include page="<%=center%>" />
        </td>
      </tr>

      <%--Bottom 부분--%>
      <tr>
        <td>
          <jsp:include page="Bottom.jsp" />
        </td>
      </tr>
    </table>
  </center>
</body>
</html>
