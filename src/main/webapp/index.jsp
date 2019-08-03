<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>

<head>
<meta charset="UTF-8">
<title>SSM项目</title>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${path }/static/js/jquery-2.1.1.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。 -->
	<script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<!-- Modal 编辑员工 模态框 -->
	<div class="modal fade" id="update_emp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" >
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control-static" name="empName"
									placeholder="员工姓名" id="empNameUpdate"> <span
									class="help-block"></span> -->
									<p class="form-control-static" id="empNameUpdate"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="mail" class="col-sm-2 control-label">E-Mail</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="mail"
									placeholder="mail@zhang.com" id=mailUpdate> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio1" value="m" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio2" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="department" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<select class="form-control" name=dId>

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal 添加员工模态框 -->
	<div class="modal fade" id="add_emp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_detail">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName"
									placeholder="员工姓名" id="empNameInput"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="mail" class="col-sm-2 control-label">E-Mail</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="mail"
									placeholder="mail@zhang.com" id=mailInput> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio1" value="m" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio2" value="f"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="department" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-4">
								<select class="form-control" name=dId>

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_add_btn">保存</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<!--使用栅格系统  -->
		<div class="row">
			<div class="11col-md-4">
				<h1>SSM-Demo项目</h1>
			</div>

		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" id="add_btn">新增</button>
				<button type="button" class="btn btn-danger" id="del_all_btn">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emptbl">
					<thead>
					<tr>
						<th>
							<input type="checkbox" id="items_all"/>
						</th>
						<th>#</th>
						<th>员工姓名</th>
						<th>邮箱地址</th>
						<th>性别</th>
						<th>所属部门</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>

					</tbody>


				</table>
			</div>

		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>

	<script type="text/javascript">
	
	
	//全局变量
	var totalPages;
	var currentPageNum;
		$(function() {
			$.ajax({
				url : "${path}/emp",
				data : "1",
				success : function(result) {

					build_emp_table(result);
					build_page_info(result);
					build_page_nav(result)
				}
			})
		})
		//跳转页面函数
		function to_page(pn) {
			$.ajax({
				url : "${path}/emp",
				data : "pn=" + pn,
				success : function(result) {

					build_emp_table(result);
					build_page_info(result);
					build_page_nav(result)
				}
			})
		}

		//构建员工分页列表
		function build_emp_table(result) {
			$("#emptbl tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,
					function(index, emp) {
						var item = $("<td></td>").append("<input type='checkbox' class='item'/>");
						
						
						var empIdTd = $("<td></td>").append(emp.empId);
						var empNameTd = $("<td></td>").append(emp.empName);
						var mail = $("<td></td>").append(emp.mail);
						var gender = $("<td></td>").append(
								emp.gender == "m" ? "男" : "女");
						var dept = $("<td></td>")
								.append(emp.department.depName);
						/* 
						构造 编辑，删除 按钮
						<td>
						<button type="button" class="btn btn-info">编辑</button>
						<button type="button" class="btn btn-danger">删除</button>
						</td>
						
						 */

						var edtBtn = $("<button></button>").addClass(
								"btn btn-info edt-btn").attr("type", "button").append($("<span> </span>").addClass("glyphicon glyphicon-pencil")).append(
								" 编辑");
						 edtBtn.attr("edt-id",emp.empId);
						var delBtn = $("<button></button>").addClass(
								"btn btn-danger del-btn").append($("<span> </span>").addClass("glyphicon glyphicon-trash")).append(" 删除").attr("type",
								"button");
						delBtn.attr("del-id",emp.empId);
						var btnTd = $("<td></td>").append(edtBtn).append(" ")
								.append(delBtn);
						var empTr = $("<tr></tr>").append(item)
								.append(empIdTd).append(
								empNameTd).append(mail).append(gender).append(
								dept).append(btnTd);
						$("#emptbl tbody").append(empTr);

					});

		}
		//构建分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			//全局变量初始化
			totalPages=result.extend.pageInfo.total;
			currentPageNum=result.extend.pageInfo.pageNum;
			var temp = $("<div>当前第" + result.extend.pageInfo.pageNum + "页，共"
					+ result.extend.pageInfo.pages + "页，总共"
					+ result.extend.pageInfo.total + "条记录</div>");
			temp.appendTo("#page_info_area");

			//$("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页，共"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");

		}

		//构建分页导航
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var nav = $("<nav></nav>").attr("aria-label", "Page navigation");
			var nav_ul = $("<ul></ul>").addClass("pagination");
			//构建首页导航			
			var firstPage = $("<li></li>").append(
					$("<a></a>").attr("href", "#").append("首页"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPage.addClass("disabled")
			} else {
				firstPage.click(function() {
					to_page(1);
				})
			}
			if (result.extend.pageInfo.pageNum != 1) {
				nav_ul.append(firstPage);
			}

			//构建前一页导航
			var nav_pre_span = $("<span></span>").attr("aria-hidden", "true")
					.append("&laquo;");
			var nav_pre_a = $("<a></a>").attr({
				href : "#",
				"aria-label" : "Previous"
			}).append(nav_pre_span);
			var nav_pre = $("<li></li>").append(nav_pre_a);
			if (result.extend.pageInfo.hasPreviousPage == false) {
				nav_pre.addClass("disabled")
			} else {
				nav_pre.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				})
			}
			nav_ul.append(nav_pre);
			//构建数字导航
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var nav_a = $("<a></a>").append(item).attr("href", "#");
				var nav_li = $("<li></li>").append(nav_a);
				if (result.extend.pageInfo.pageNum == item) {
					nav_li.addClass("active");
				}
				nav_li.click(function() {
					to_page(item);

				});
				nav_ul.append(nav_li);
			})
			//构建后一页导航
			var nav_next_span = $("<span></span>").attr("aria-hidden", "true")
					.append("&raquo;");
			var nav_next_a = $("<a></a>").attr({
				href : "#",
				"aria-label" : "Next"
			}).append(nav_next_span);
			var nav_next = $("<li></li>").append(nav_next_a);
			if (result.extend.pageInfo.hasNextPage == false) {
				nav_next.addClass("disabled")
			} else {
				nav_next.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				})
			}
			nav_ul.append(nav_next);
			//构建末页导航			
			var lastPage = $("<li></li>").append(
					$("<a></a>").attr("href", "#").append("末页"));
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPage.addClass("disabled")
			} else {
				lastPage.click(function() {
					to_page(result.extend.pageInfo.pages);
				})
			}
			if (result.extend.pageInfo.pageNum != result.extend.pageInfo.pages) {
				nav_ul.append(lastPage);
			}

			nav_ul.appendTo(nav);
			nav.appendTo("#page_nav_area");
		}
		
		//新建按钮触发
		$("#add_btn").click(function() {
			
			//每次点击按钮后重置表单数据
			$("#add_emp form")[0].reset();
			//重置表单样式及提示信息
			form_reset("#add_emp form");
			
			
			//取得部门信息，并显示在下拉列表中
			getDepts("#add_emp select");
			$('#add_emp').modal({
				"backdrop" : "static"
			});
		})
		
		//取得部门信息
		function getDepts(depEle){
			$.ajax({
				url : "${path}/depts",
				
				success : function(result) {
					//构建下拉列表
					build_depts_select(result,depEle);
					

				}
			})
		}
		//构建部门下拉列表
		function build_depts_select(result,depEle){
			$(depEle).empty();
			$.each(result.extend.depts,function(){
				var dept_option = $("<option></option>").append(this.depName).attr("value",this.depId);
				dept_option.appendTo(depEle);
			})
		}
		
		//重置表单样式及内容
		function form_reset(ele){
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find("span").text("")
		}
		//提取重复代码 表单验证方法
		function form_advise(ele,status,msg){
			
			//$(ele).parent().removeClass("has-error has-success");
			//$(ele).next("span").text("")
			if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}
		}
		//表单校验
		function validateForm(){
			//姓名校验
			var empNameTemp = $("#empNameInput").val();
			var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			
			//保存服务器验证的信息
			var serv_info = $("#empNameInput").next("span").text();
			//console.log("servInfo信息="+serv_info);
			
			//验证之前清除格式
			$("#empNameInput").parent().removeClass("has-error has-success");
			$("#empNameInput").next("span").text("")
			
			if(!empNameReg.test(empNameTemp)){
				
				
				//alert("姓名格式不正确，必须为2到5位汉字或6到16位英文");
				form_advise("#empNameInput","error","姓名格式不正确，必须为2到5位汉字或6到16位英文");
				/* $("#empNameInput").parent().addClass("has-error");
				$("#empNameInput").next("span").text("姓名格式不正确，必须为2到5位汉字或6到16位英文"); */
				return false;
			}else if(serv_info=="用户名已存在"){
				//在进行表单检验前已进行服务器端校验 需要保留服务器校验的信息
				form_advise("#empNameInput","error","用户名已存在");
				return false;
				
			}
				
					else{
				form_advise("#empNameInput","success","");
				/* $("#empNameInput").parent().addClass("has-success");
				$("#empNameInput").next("span").text(""); */
			}
			//邮箱校验	
			var mailTemp = $("#mailInput").val();
			var mailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			//验证之前清除格式
			$("#mailInput").parent().removeClass("has-error has-success");
			$("#mailInput").next("span").text("")
			if(!mailReg.test(mailTemp)){
				//alert("邮箱格式不正确");
				form_advise("#mailInput","error","邮箱格式不正确");
				/* $("#mailInput").parent().addClass("has-error");
				$("#mailInput").next("span").text("邮箱格式不正确"); */
				return false;
			}else{
				form_advise("#mailInput","success","");
				/* $("#mailInput").parent().addClass("has-success");
				$("#mailInput").next("span").text(""); */
			}
			
			return true;
			
		}
		
		//判断是否有重复用户名
 		$("#empNameInput").change(function(){
			$.ajax({
				url:"${path}/empCheck",
				data:"empName="+this.value,
				success:function(result){
					if(result.code==200){
						//如果已存在提示该用户已存在
						form_advise("#empNameInput","error",result.extend.va_error);
						$("#emp_add_btn").attr("validate-val","error");
					}else{
						$("#empNameInput").parent().removeClass("has-error has-success");
						$("#empNameInput").next("span").text("")
						form_advise("#empNameInput","success","");
						$("#emp_add_btn").attr("validate-val","success");
					}
				}
			});
		}); 
		
		
		//点击按钮 员工保存
		$("#emp_add_btn").click(function(){
			
			//进行表单校验
			  if(!validateForm()){
				return false;
			};  
			
			
			//判断是否有重复用户名
			if("error"==$("#emp_add_btn").attr("validate-val")){
				return false;
			}
			
			//alert($("form").serialize());
			$.ajax({
					url:"${path}/emp",
					type:"POST",
					data:$("#emp_detail").serialize(),
					success:function(result){
						//alert(result.extend.msgMap.empName);
						console.log(result);
						if(result.code==100){
							$("#add_emp").modal('hide');
							to_page(totalPages+1);
							return false;
						}else
						{
 							if(undefined!=result.extend.msgMap.empName){
								//验证之前清除格式							
								$("#empNameInput").parent().removeClass("has-error has-success");
								$("#empNameInput").next("span").text("");
								form_advise("#empNameInput","error",result.extend.msgMap.empName);
								}
							if(undefined!=result.extend.msgMap.mail){
								//验证之前清除格式
								$("#mailInput").parent().removeClass("has-error has-success");
								$("#mailInput").next("span").text("");
								form_advise("#mailInput","error",result.extend.msgMap.mail);
							}
						}  
						}
						
					})
					
				//}) 
			});
			
			
			
			//员工编辑功能
			$(document).on("click",".edt-btn",function(){
				//alert("edt-btn");
				//alert($(this).attr("edt-id"));
				
				//取得部门信息 构建部门下拉列表
				getDepts("#update_emp select");
				//取得员工信息 构建回显信息
				getEmp($(this).attr("edt-id"));	
				//弹出模态框
				$('#update_emp').modal({
					"backdrop" : "static"
				});
				
				//将员工ID传递给更新按钮
				$("#emp_update_btn").attr("edt-id",$(this).attr("edt-id"));
				
				
				
				
			})
			//点击更新按钮 发送ajax请求更新员工信息
			$(document).on("click","#emp_update_btn",function(){
				//验证邮箱格式
				var mailTemp = $("#mailUpdate").val();
				var mailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				//验证之前清除格式
				$("#mailUpdate").parent().removeClass("has-error has-success");
				$("#mailUpdate").next("span").text("")
				if(!mailReg.test(mailTemp)){
					form_advise("#mailUpdate","error","邮箱格式不正确");
					return false;
				}else{
					form_advise("#mailUpdate","success","");
				}
				//发起ajax PUT请求
				/*
				*注意，tomcat在接收put请求时，不会去封装数据 ，这时候就需要HiddenHttpMethodFilter 过滤器来将post请求转换为put跟delete请求。
				需要在data数据中增加 "&_method=PUT"
				另外一种方法，引入HttpPutFormContentFilter过滤器，可以直接用type="PUT"方式发送请求
				*/
				$.ajax({
					url:"${path}/emp/"+$(this).attr("edt-id"),
					data:$("#update_emp form").serialize()+"&_method=PUT",
					type:"POST",
					success:function(result){
						if(result.code==100){						
							$("#update_emp").modal('hide');
							to_page(currentPageNum);			
						}
					}
				})
			})
			
			//取得部门信息 构建部门下拉列表
			function getEmp(id){
				$.ajax({
					url:"${path}/emp/"+id,
					type:"GET",
					success:function(result){
						//console.log(result);
						$("#empNameUpdate").text(result.extend.emp.empName);
						$("#mailUpdate").val(result.extend.emp.mail);
						
						//(注意 val()中要放数组 表示表单填入的值 如果不用数组表示将value属性改为该值 )
						$("#update_emp input[name=gender]").val([result.extend.emp.gender]);
						$("#update_emp select").val([result.extend.emp.dId]);
						
						
					}
				})
			}
			
			$(document).on("click",".del-btn",function(){
				//弹出警告
				var empName = $(this).parent("td").parent("tr").children("td").eq(2).text();
				//alert("是否要删除"+empName+"的信息");
				//alert($(this).attr("del-id"));
				 if(confirm("确定要删除【"+empName+"】的信息？")){
					$.ajax({
						url:"${path}/emp/"+$(this).attr("del-id"),
						type:"DELETE",
						success:function(result){
							if(result.code==100){
								to_page(currentPageNum);
							}
						}
					});
				} 	
			})
			
			//总勾选逻辑
			$("#items_all").click(function(){
				//alert($(this).prop("checked"));
				$(".item").prop("checked",$(this).prop("checked"));
			});
			
			//单个勾选逻辑
			$(document).on("click",".item",function(){
				var item_checked_count =0;
				$(".item").each(function(){
					if($(this).prop("checked")){
						//alert($(this).parent("td").parent("tr").children().eq(2).text());
						item_checked_count++;
					}	
				});
				if(item_checked_count==$(".item").length){
					$("#items_all").prop("checked",true);
				}else{
					$("#items_all").prop("checked",false);
				}
			});
			
			//删除全部已选项目
			$(document).on("click","#del_all_btn",function(){
				
				var del_items_name = "";
				var del_items_id = "";
				$(".item").each(function(){
					if($(this).prop("checked")){
						del_items_name += $(this).parent("td").parent("tr").children().eq(2).text()+",";
						del_items_id += $(this).parent("td").parent("tr").children().eq(1).text()+"-";
					}	
				});
				del_items_name = del_items_name.substring(0,del_items_name.length-1);
				del_items_id = del_items_id.substring(0,del_items_id.length-1);
				//alert("您要删除【"+del_items_name+"】");
				//弹出警告提示确认
				if(confirm("您要删除【"+del_items_name+"】吗？")){
					//发送ajax请求 
					//删除ID以“-”分割 
					 $.ajax({
						url:"${path}/emp/"+del_items_id,
						type:"DELETE",
						success:function(result){
							alert(result.msg);
							//返回原来所在页
							to_page(currentPageNum);
						}
					})
					
				}
				
			});
	</script>

</body>
</html>