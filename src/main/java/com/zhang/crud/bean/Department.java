package com.zhang.crud.bean;

import java.io.Serializable;

public class Department  implements Serializable{
    private Integer depId;

    private String depName;

    public Department() {
		super();
	}

	public Department(Integer depId, String depName) {
		super();
		this.depId = depId;
		this.depName = depName;
	}

	public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName == null ? null : depName.trim();
    }
}