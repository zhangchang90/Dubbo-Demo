package com.zhang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhang.crud.bean.Department;
import com.zhang.crud.dao.DepartmentMapper;

@Service
public interface DepartmentService {

	public List<Department> getDepts();

}
