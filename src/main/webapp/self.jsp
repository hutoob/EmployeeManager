<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="dao.Util" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="bean.Employee" %>
<%
    String id=request.getSession().getAttribute("emid").toString();
    String sql="select * from employee where id="+id;
    Connection con= Util.getConnection();
    PreparedStatement preparedStatement=con.prepareStatement(sql);
    ResultSet resultSet=preparedStatement.executeQuery();
    Employee employee=new Employee();
    if(resultSet.next()){
        employee.setId(resultSet.getString("id"));
        employee.setName(resultSet.getString("name"));
        employee.setSex(resultSet.getString("sex"));
        employee.setDepartment(resultSet.getString("department"));
        employee.setLevel(resultSet.getString("level"));
    }
%>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css">
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
</head>
<body>
    <table class="layui-table">
        <tr>
            <td>编号:</td>
            <td><%=employee.getId()%></td>
        </tr>
        <tr>
           <td>姓名:</td>
           <td><%=employee.getName()%></td>
        </tr>
        <tr>
            <td>部门:</td>
            <td><%=employee.getDepartment()%></td>
        </tr>
        <tr>
            <td>级别:</td>
            <td><%=employee.getLevel()%></td>
        </tr>
    </table>

</body>
</html>
