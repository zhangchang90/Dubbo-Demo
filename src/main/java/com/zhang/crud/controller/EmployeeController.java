package com.zhang.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhang.crud.bean.Employee;
import com.zhang.crud.bean.Msg;
import com.zhang.crud.service.EmployeeService;
  
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	//删除员工
	@RequestMapping(value="/emp/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("id") String empIdStr) {
		if(empIdStr.indexOf("-")==0) {
			Integer del_ids = Integer.parseInt(empIdStr);
			employeeService.delete(del_ids);
			return Msg.success();
		}else {
			List del_ids = new ArrayList<>();
			String[] empIds = empIdStr.split("-");			
			for (String del_id : empIds) {
				del_ids.add(Integer.parseInt(del_id));
			}
			employeeService.delete(del_ids);
			return Msg.success();
		}
	}
	
	
	
	//更新员工信息
	
	@RequestMapping(value = "/emp/{id}" , method = RequestMethod.PUT )
	@ResponseBody
	public Msg update(@PathVariable("id") Integer empId, Employee employee) {
		employee.setEmpId(empId);
		System.out.println("更新员工的信息为"+employee);
		employeeService.update(employee);
		return Msg.success();
		
	}
	
	
	//用户验证
	@RequestMapping(value = "/empCheck" )
	@ResponseBody
	public Msg empCheck(@RequestParam(value="empName") String empName) {
		//在服务器端对用户名表达式进行验证
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regex)) {
			return Msg.fail().add("va_error", "用户名必须为2到5位汉字或6到16位英文");
		};
		
		
		//如果不存在该用户返回true
		boolean b = employeeService.empCheck(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_error", "用户名已存在");
		}
		
		
		
	}
	
	//保存用户
	@RequestMapping(value = "/emp",method = RequestMethod.POST )
	@ResponseBody
	public Msg savEmp(@Valid Employee employee, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			//如果校验有错误返回
			Map msgMap = new HashMap<>();
			
			List<FieldError> fieldErrors = bindingResult.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				msgMap.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			
			return Msg.fail().add("msgMap", msgMap);
		}else {
		
		employeeService.saveEmp(employee);
		return Msg.success();
		}
	}
	
	
	@RequestMapping(value = "/emp")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn) {
		
		//PageHelper.startPage(pn, 5);
		//List<Employee> emps = employeeService.getAll();
		//for (Employee employee : emps) {
		//	System.out.println("controller+"+employee);
		//}
		
		PageInfo page = employeeService.getPageInfo(pn, 5);
		System.out.println("page信息====="+page);

		
		return Msg.success().add("pageInfo", page);
		
		
	}	
	//查询指定empId的员工信息
	
	@RequestMapping(value="/emp/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer empId) {
		
		Employee emp = employeeService.getEmpById(empId);
		return Msg.success().add("emp", emp);
		
	}
	
	@SuppressWarnings("all")  
	//@RequestMapping(value = "/emps")
	public String getEmps(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn, Model model) {
		
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		
		
		return "list";
		
		
	}
	
}
