package com.zhang.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.zhang.crud.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/DispatcherServlet-servlet.xml" })
@WebAppConfiguration
public class MVCtest {

	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	   @Before
	    public void setup() {
	        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();   //构造MockMvc
	    }
	   @Test
	   public void mvcTest() throws Exception {
		   MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps" ).param("pn", "1")).andReturn();
		   
		   PageInfo pi = (PageInfo) result.getRequest().getAttribute("pageInfo");
		   
		   System.out.println("当前页码 "+pi.getPageNum());
		   System.out.println("每页的数量 "+pi.getPageSize());
		   System.out.println("总页数 "+pi.getPages());
		   System.out.println("总记录数 "+pi.getTotal());
		   System.out.println("在页面需要连续显示的页码");
		   int[] navigatepageNums = pi.getNavigatepageNums();
		   for (int i : navigatepageNums) {
			System.out.print(i+ " ");
		}
		   
		   List<Employee> emps = pi.getList();
		   for (Employee employee : emps) {
			System.out.println("员工号 "+employee.getEmpId()+" 员工名字 "+employee.getEmpName()+" 部门"+employee.getDepartment());
		}
	   }
}

