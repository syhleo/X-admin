<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#order_list .layui-table-cell{
	font-size:14px;
}
</style>    
    
</head>
<body id="order_list">
	<table class="layui-hide" id="test" lay-filter="demo"></table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>		
	</script>
	<hr><hr>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>		
	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger " lay-event="del">删除</a>	
	<hr><hr>
	
	
	
	
	
	
	<script>
		layui.use(['laydate','laypage','layer','table','element'],function(){
			var table1=layui.table;//表格
			var element=layui.element;//元素操作
			layer.msg("测试数据表格!");
			//执行一个table实例
			table1.render(
				{
					elem:"#test",
					height:332,
					url:"user.json",//数据接口  //可以查看 http://www.layui.com/demo/   http://www.layui.com/doc/modules/table.html
					page:true, //开启分页
					cols:[
						[// 表头
						 	{field:"id",title:"ID",style:"background-color: #5FB878; color: #fff;",sort:true,fixed:"left"},
						 	{field:"username",title:"用户名"},
						 	{field:"sex",title:"性别",sort:true},
						 	{field: 'city', title: '城市'}, 
						    {field: 'sign', title: '签名'},
						    {field: 'experience', title: '积分',sort: true},
						    {field: 'score', title: '评分', sort: true},
						    {field: 'classify', title: '职业'},
						    {field: 'wealth', title: '财富',sort: true},
						    {fixed: 'right',align:'center', toolbar: '#barDemo'}
						 ]
					]
				}
			);
			 //监听工具条
			table1.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			    var data = obj.data; //获得当前行数据
			    layEvent = obj.event; //获得 lay-event 对应的值
			    if(layEvent === 'detail'){
			      layer.msg('查看操作');
			    } else if(layEvent === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        obj.del(); //删除对应行（tr）的DOM结构
			        layer.close(index);
			        //向服务端发送删除指令
			      });
			    } else if(layEvent === 'edit'){
			      layer.msg('编辑操作');
			    }
			});
			
			
	
		});
	
	</script>
</body>
</html>