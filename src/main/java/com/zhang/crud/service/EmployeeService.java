package com.zhang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhang.crud.bean.Employee;
import com.zhang.crud.bean.EmployeeExample;
import com.zhang.crud.bean.EmployeeExample.Criteria;
import com.zhang.crud.dao.EmployeeMapper;
@Service
public interface EmployeeService {

	
	public PageInfo getPageInfo(Integer pn, Integer pageSize);
	public List<Employee> getAll() ;

	public void saveEmp(Employee employee);

	public boolean empCheck(String empName) ;

	public Employee getEmpById(Integer empId);

	public void update(Employee employee) ;

	public void delete(Integer empId) ;

	public void delete(List del_ids) ;
}
