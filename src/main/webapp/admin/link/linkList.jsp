<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.js"></script>
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test">

</table>

<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs" lay-event="modifyLink">编辑</a>
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="addLinkImage">上传图片</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>

<script>

    layui.use('table', function(){

        var table = layui.table;
        //详见：https://www.layui.com/doc/modules/table.html#totalRow
        var dataTable = table.render({
            elem: '#test'
            // 每页大小
            ,limit:10
            ,url:'${pageContext.request.contextPath}/admin/link/list.do'
            // 往后端传limit和page参数
            ,method:"get"
            ,toolbar: '#toolbarDemo'
            ,title: '博客类别数据表'
            ,totalRow: true
            ,cols: [[
                {type: 'checkbox', fixed: 'left', align:'center', width:60}
                ,{field:'id', title:'ID', width:80, align:'center', fixed: 'left', unresize: true, sort: true, totalRowText: '合计'}
                ,{field:'linkImage', title:'头像', width:150 , align:'center', templet:function (data) {
                        var imageName = data.linkImage;
                        return '<img src="${pageContext.request.contextPath}/static/images/'+imageName+'" style="width: 100px; height: 30px;" />';
                    }}
                ,{field:'linkName', title:'名称', align:'center'}
                ,{field:'linkUrl', title:'地址', align:'center', edit: 'text'}
                ,{field:'orderNo', title:'排序', width:150, align:'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#bar', width:220}

            ]]
            ,page: true
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='addLink'){
                //打开一个新窗口
                layer.open({
                    type: 2
                    ,title:'添加友情链接'
                    ,maxmin:'true'
                    ,shadeClose: false
                    ,area: ['100%','100%']
                    ,content: '${pageContext.request.contextPath}/admin/link/addLink.jsp'
                });

            }else if(obj.event=='deleteLink'){
                var data = checkStatus.data;
                //得到该选中行中的具体数据
                var strIds = [];
                for(var i=0;i<data.length;i++){
                    strIds.push(data[i].id);
                }
                var ids = strIds.join(",");
                if (ids == null || ids == "") {
                    layer.alert("请选择至少要删除的一条友情链接！");
                    return;
                }
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/link/delete.do",{ids:ids},function (result) {
                        if(result.success){
                            alert("成功删除！");
                            dataTable.reload();
                        }else{
                            alert("删除失败，请联系系统管理员！");
                        }
                    },"json");
                });
            }
        });

        // 审核通过按钮事件监听
        table.on('tool(test)',function (obj) {
            if(obj.event==='modifyLink'){
                var data = obj.data;
                //得到该选中行中的具体数据
                var id = data.id;
                //打开一个新窗口
                layer.open({
                    type: 2
                    ,title:'修改友情链接'
                    ,maxmin:'true'
                    ,shadeClose: false
                    ,area: ['100%','100%']
                    ,content: '${pageContext.request.contextPath}/admin/link/modifyLink.jsp'
                    ,success:function (layero,index) {
                        var iframe = window['layui-layer-iframe'+index];
                        // 传到modifyBlog.jsp页面的参数
                        iframe.childLinkId(id);
                        iframe.childLinkData(data);
                    }
                });

            }else if(obj.event==='del'){
                var data = obj.data;
                //得到该选中行中的具体数据
                var ids = data.id;
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/link/delete.do",{ids:ids},function (result) {
                        if(result.success){
                            layer.alert("删除成功！");
                            dataTable.reload();
                        }else{
                            layer.alert("删除失败，请联系系统管理员！");
                        }
                    },"json");
                });

            }else if (obj.event === 'addLinkImage') {
                var data = obj.data;
                var id = data.id;
                //打开一个新窗口
                layer.open({
                    type: 2
                    ,title:'添加链接头像'
                    ,maxmin:'true'
                    ,shadeClose: false
                    ,area: ['50%','50%']
                    ,content: '${pageContext.request.contextPath}/admin/link/addLinkImage.jsp'
                    ,success:function (layero,index) {
                        var iframe = window['layui-layer-iframe'+index];
                        // 传到addLinkImage.jsp页面的参数
                        iframe.childLinkId(id);
                        iframe.childLinkData(data);
                    }
                });
            }
        });

        // 搜索功能(未开发)
        $("#searchBtn").on('click',function () {
            dataTable.reload({
                where:{
                    title: String("要查询的数据")
                }
            })
        });

    });
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="addLink">添加友情链接</button>
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteLink">批量删除</button>
    </div>
</script>

</body>
</html>