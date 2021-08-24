<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工信息总览</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css"/>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
</head>
<body>
    <table class="layui-table" id="employeeInfo" lay-filter="employeeInfo"></table>
<%--    <script type="text/html" id="barDemo">--%>
<%--        <div class="layui-btn-container">--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="detail">查看</button>--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="edit">编辑</button>--%>
<%--            <button class="layui-btn layui-btn-danger  layui-btn-sm" lay-event="changeStu">删除</button>--%>
<%--        </div>--%>
<%--    </script>--%>
<script>
    alert("sssszzz");
    layui.use(['table','form','layer','jQuery'],function(){
        alert("kakak");
        // var table=layui.table,
        // form=layui.form,
        // layer=layui.layer,
        // $=layui.jQuery;
        // alert("执行");
        // table.render({
        //     elem:'#employeeInfo'
        //     ,id:'employeeInfo'
        //     ,url:'Servlet'
        //     ,where:{"method":"showEm"}
        //     ,page:true
        //     ,text:'数据加载失败'
        //     ,cols:[[
        //         {checkbox: true, fixed: true}
        //         ,{field:'id', title: '编号', width:80, sort: true, fixed: true}
        //         ,{field:'name', title: '姓名', width:80, sort: true}
        //         ,{field:'sex', title: '性别', width:80, sort: true,edit:true}
        //         ,{field:'department', title: '部门', width:180}
        //         ,{field:'level', title: '级别', width:100}
        //         ,{field:'right', title: '操作', width:177,toolbar:"#barDemo"}
        //     ]]
        //     ,parseData:function (res) {
        //         return{
        //             "code":"200",
        //             "msg":"",
        //             "count":res.total,
        //             "data":res.data.item
        //         };
        //     }
        // });
    });
</script>
</body>
</html>
