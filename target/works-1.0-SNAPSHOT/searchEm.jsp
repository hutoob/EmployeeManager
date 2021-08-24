<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询员工信息</title>
    <link rel="stylesheet" href="resource/layui/css/layui.css">
    <script src="js/jquery-1.11.0.js"></script>
    <script src="resource/layui/layui.js"></script>
    <link rel="stylesheet" href="css/search.css">
</head>
<body>
<div>
    <form class="search_form" action="" method="post">
        <select class="query" id="query">
            <option value ="编号">编号</option>
            <option value ="姓名">姓名</option>
            <option value ="性别">性别</option>
            <option value ="部门">部门</option>
            <option value ="级别">级别</option>
        </select>
        <input type="text" class="input_text" placeholder="请输入搜索内容" id="in_text">
        <input type="button" value="搜索 " class="input_sub" id="up">
    </form>
</div>
<div id="show">
    <table class="layui-table">
        <thead>
        <tr>
            <th width="70">编号</th>
            <th width="70">姓名</th>
            <th width="70">性别</th>
            <th width="70">部门</th>
            <th width="70">级别</th>
        </tr>
        </thead>
        <tbody class="x-cate" id="test">
        </tbody>
    </table>
</div>
<script>
    layui.use(['form','layer','table'],function () {
        var layer=layui.layer
        ,form=layui.form
        ,table=layui.table;
    });
    function search() {
        var type=document.getElementById("query").value;
        var adimition=$('#in_text').val();
        $.ajax({
            url:'Servlet?method=searchEm',
            type:'post',
            data:{"type":type,"admition":adimition},
            async:true,
            datatype:'JSON',
            success:function (data) {
                if(data=='未查到相关信息'){
                    layer.alert(data);
                }
                else{
                    var datas=eval("("+data+")");
                    var tt=datas;
                    var str="";
                    for(var i=0;i<tt.length;i++){
                        str+="<tr cate-id='0' fid='0'>"+"<td>"+tt[i].id+"</td>"+
                            "<td>"+tt[i].name+"</td>"+
                            "<td>"+tt[i].sex+"</td>"+
                            "<td>"+tt[i].department+"</td>"+
                            "<td>"+tt[i].level+"</td>"+"<tr>";
                    }
                    test.innerHTML=str;
                }
            },
            error:function (){
                alert("查询失败");
            }
        });
    }
    $(function () {
        $('#up').click(function () {
            search();
        })
    })
</script>
</body>
</html>
