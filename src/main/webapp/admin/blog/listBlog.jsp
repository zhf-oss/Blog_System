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
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test">

</table>

<script type="text/html" id="bar">
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
            ,url:'${pageContext.request.contextPath}/admin/blog/list.do'
            // 往后端传limit和page参数
            ,method:"get"
            ,toolbar: '#toolbarDemo'
            ,title: '用户数据表'
            ,totalRow: true
            ,cols: [[
                {type: 'checkbox', fixed: 'left', align:'center'}
                ,{field:'id', title:'ID', width:80, align:'center', fixed: 'left', unresize: true, sort: true, totalRowText: '合计'}
                ,{field:'title', title:'标题', align:'center',
                    templet:function (data) {
                        // a标签，用于该评论是属于哪章博客
                        url = data.id;
                        return '<a class="iconfont icon-chakanbaogao" href="${pageContext.request.contextPath}/blog/articles/'+url+'.html" style="margin-left: 3%; color: #2196F3;border-radius: 5px; cursor: pointer;text-decoration: underline;" target="_blank"><span>' +data.title+'</span></a>'
                    }}
                ,{field:'summary', title:'摘要', width:120, align:'center', hide:'false'}
                ,{field:'releaseDate', title:'发布时间', align:'center', width:120}
                ,{field:'clickHit', title:'阅读数', width:100, align:'center'}
                ,{field:'replyHit', title:'评论数', width:100, align:'center'}
                ,{field:'content', title:'博客内容', width:120, align:'center', hide:'false'}
                // 取对象里面的对象，例子(很重要)
                ,{field:'blogType', title:'类型', width:120, align:'center',
                    templet:function (data) {
                        return '<span>' +data.blogType.typeName+'</span>'
                    }}
                ,{field:'keyWord', title:'关键字', align:'center', edit: 'text', width:250}
                ,{fixed: 'right', title:'操作', toolbar: '#bar', width:100, align:'center'}
            ]]
            ,page: true
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            if(obj.event=='modifyBlog'){
                var data = checkStatus.data;
                if(data.length<1){
                    layer.alert("请选择一条要修改的博客！")
                }else if(data.length==1){
                    //得到该选中行中的具体数据
                    var id = data[0].id;
                    //打开一个新窗口
                    layer.open({
                        type: 2
                        ,title:'修改博客'
                        ,maxmin:'true'
                        ,shadeClose: false
                        ,area: ['100%','100%']
                        ,content: '${pageContext.request.contextPath}/admin/blog/modifyBlog.jsp'
                        ,success:function (layero,index) {
                            var iframe = window['layui-layer-iframe'+index];
                            // 传到modifyBlog.jsp页面的参数
                            iframe.child(id);
                            iframe.childData(data);
                        }
                    });

                }else{
                    layer.alert("一次只能修改一条博客！")
                }
            }else if(obj.event=='deleteBlog'){
                var data = checkStatus.data;
                // 得到该选中行中的具体数据
                var strIds = [];
                for(var i=0;i<data.length;i++){
                    strIds.push(data[i].id);
                }
                var ids = strIds.join(",");
                if (ids == null || ids == "") {
                    layer.alert("请选择至少要删除的一条数据！");
                    return;
                }
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/blog/delete.do",{ids:ids},function (result) {
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

        // 删除博客文章按钮事件监听
        table.on('tool(test)',function (obj) {
            if(obj.event==='del'){
                var data = obj.data;
                //得到该选中行中的具体数据
                var ids = data.id;
                layer.confirm('你确定要删除吗',{
                    btn : ['确定','取消']
                },function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/admin/blog/delete.do",{ids:ids},function (result) {
                        if(result.success){
                            layer.alert("删除成功！");
                            dataTable.reload();
                        }else{
                            layer.alert("删除失败，请联系系统管理员！");
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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="modifyBlog">修改博客</button>
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBlog">批量博客</button>
    </div>
</script>

</body>
</html>