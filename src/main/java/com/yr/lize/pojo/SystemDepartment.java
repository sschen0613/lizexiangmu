package com.yr.lize.pojo;

public class SystemDepartment {
    private Integer department_Id;

    private String department_Name;

    private Integer superior_Id;
    
    private Integer company_Id;
    
    private String ding_depmid;
    private Integer delete_id;
    private Integer sort;
    

	public String getDing_depmid() {
		return ding_depmid;
	}

	public void setDing_depmid(String ding_depmid) {
		this.ding_depmid = ding_depmid;
	}

	public Integer getDepartment_Id() {
		return department_Id;
	}

	public void setDepartment_Id(Integer department_Id) {
		this.department_Id = department_Id;
	}

	public String getDepartment_Name() {
		return department_Name;
	}

	public void setDepartment_Name(String department_Name) {
		this.department_Name = department_Name;
	}

	public Integer getSuperior_Id() {
		return superior_Id;
	}

	public void setSuperior_Id(Integer superior_Id) {
		this.superior_Id = superior_Id;
	}

	public Integer getCompany_Id() {
		return company_Id;
	}

	public void setCompany_Id(Integer company_Id) {
		this.company_Id = company_Id;
	}

	public Integer getDelete_id() {
		return delete_id;
	}

	public void setDelete_id(Integer delete_id) {
		this.delete_id = delete_id;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
}