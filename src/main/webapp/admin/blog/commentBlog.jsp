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
    <a class="layui-btn layui-btn-xs" lay-event="passComment">审核通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>

    layui.use('table', function(){

        var table = layui.table;
        var dataTable = table.render({
            elem: '#test'
            // 每页大小
            ,limit:10
            ,url:'${pageContext.request.contextPath}/admin/comment/list.do'
            // 往后端传limit和page参数
            ,method:"get"
            ,toolbar: '#toolbarDemo'
            ,title: '评论数据表'
            ,totalRow: true
            ,cols: [[
                {type: 'checkbox', fixed: 'left', align:'center'}
                ,{field:'id', title:'ID', width:80, align:'center', fixed: 'left', unresize: true, sort: true, totalRowText: '合计'}
                ,{field:'content', title:'评论内容', edit: 'text', align:'center'}
                ,{field:'ip', title:'IP地址', width:150, align:'center'}
                ,{field:'blogId', title:'博客Id', width:150, align:'center'}
                // 取对象里面的对象，例子(很重要)
                ,{field:'blog', title:'博客标题', width:160, align:'center',
                    templet:function (data) {
                        // a标签，用于该评论是属于哪章博客
                        url = data.blog.id;
                        return '<a class="iconfont icon-chakanbaogao" href="${pageContext.request.contextPath}/blog/articles/'+url+'.html" style="margin-left: 3%; color: #2196F3;border-radius: 5px; cursor: pointer;text-decoration: underline;" target="_blank"><span>' +data.blog.title+'</span></a>'
                    }}
                ,{field:'date', title:'日期', width:200, align:'center'}
                ,{field:'state', title:'状态', width:150, align:'center', templet: '#state'}
                ,{fixed: 'right', title:'操作', toolbar: '#bar', width:220}
            ]]
            ,page: true
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='deleteCommennt'){
                var data = checkStatus.data;
                //得到该选中行中的具体数据
                var strIds = [];
                for(var i=0;i<data.length;i++){
                    strIds.push(data[i].id);
                }
                var ids = strIds.join(",");
                if (ids == null || ids == "") {
                    layer.alert("请选择至少一条要删除的评论！");
                    return;
                }
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/comment/delete.do",{ids:ids},function (result) {
                        if(result.success){
                            alert("数据已成功删除！");
                            dataTable.reload();
                        }else{
                            alert("数据删除失败，请联系系统管理员！");
                        }
                    },"json");
                });
            }
        });

        // 审核通过按钮事件监听
        table.on('tool(test)',function (obj) {
            if(obj.event==='passComment'){
                var data = obj.data;
                //得到该选中行中的具体数据
                var id = data.id;
                var blogId = data.blogId;
                $.post("${pageContext.request.contextPath}/admin/comment/update.do",{id:id,blogId:blogId},function (result) {
                    if(result.success){
                        layer.alert("成功审核通过");
                        dataTable.reload();
                    }else{
                        layer.alert("审核失败，请联系系统管理员！");
                    }
                },"json");

            }else if(obj.event==='del'){
                var data = obj.data;
                //得到该选中行中的具体数据
                var ids = data.id;
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/comment/delete.do",{ids:ids},function (result) {
                        if(result.success){
                            layer.alert("删除评论成功！");
                            dataTable.reload();
                        }else{
                            layer.alert("删除评论失败，请联系系统管理员！");
                        }
                    },"json");
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

<script type="text/html" id="state">
    {{#  if(d.state === 1){ }}
    <span class="layui-badge layui-bg-green" style="margin-top: 5%;">已通过审核</span>
    {{#  } else { }}
    <span class="layui-badge" style="margin-top: 5%;">未通过审核</span>
    {{#  } }}
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteCommennt">批量删除</button>
    </div>
</script>

</body>
</html>