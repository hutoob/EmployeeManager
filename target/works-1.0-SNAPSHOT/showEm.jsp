<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>热词名词解释</title>
    <link rel="stylesheet" type="text/css" href="resource/layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
    <script>
        layui.use(['laydate','table'], function () {
            var table = layui.table;
        });
    </script>
</head>
<body>
<div class="layui-card-body ">
    <table class="layui-table layui-form">
        <thead>
        <tr>
            <th width="70">编号</th>
            <th width="70">姓名</th>
            <th width="70">性别</th>
            <th width="70">部门</th>
            <th width="70">级别</th>
            <th width="210">操作</th>
        </tr>
        </thead>
        <tbody class="x-cate" id="test">
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
    var test=document.getElementById("test");
    $.ajax({
        url:"Servlet?method=showEm",
        datatype:'json',
        type:'post',
        async:true,
        success:function(data){
            alert("数据加载成功");
            var p=eval("("+data+")");
            var tt=p;
            var str="";
            for(var i=0;i<tt.length;i++){
                str+="<tr cate-id='0' fid='0'>"+"<td>"+tt[i].id+"</td>"+
                    "<td>"+tt[i].name+"</td>"+
                    "<td>"+tt[i].sex+"</td>"+
                    "<td>"+tt[i].department+"</td>"+
                    "<td>"+tt[i].level+"</td>"+
                    "<td><a href='updataEm.jsp?sid="+tt[i].id+"' class='layui-btn layui-btn-normal layui-btn-md'>修改"+"</a>&nbsp&nbsp"+
                    "<a href='Servlet?method=delete&id="+tt[i].id+"' class='layui-btn layui-btn-danger layui-btn-md'>删除"+"</a></td>"+"<tr>";
            }
            test.innerHTML=str;
        },
        error:function(arg1){
            alert("数据加载失败");
            console.log(arg1);
        }
    })
</script>
</html>
