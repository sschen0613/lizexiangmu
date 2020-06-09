package com.yr.lize.pojo;

public class SystemCompany {
    private Integer company_Id;

    private String company_Name;

    private String company_Situation;

    private String company_Manager;

    private String company_Phone;

    private String company_Address;
    
    private String company_Code;
    
    private Integer approval_money;
    
    
    public Integer getApproval_money() {
		return approval_money;
	}

	public void setApproval_money(Integer approval_money) {
		this.approval_money = approval_money;
	}

	private Integer company_superior;
    
	public Integer getCompany_superior() {
		return company_superior;
	}

	public void setCompany_superior(Integer company_superior) {
		this.company_superior = company_superior;
	}

	public String getCompany_Code() {
		return company_Code;
	}

	public void setCompany_Code(String company_Code) {
		this.company_Code = company_Code;
	}

	public Integer getCompany_Id() {
		return company_Id;
	}

	public void setCompany_Id(Integer company_Id) {
		this.company_Id = company_Id;
	}

	public String getCompany_Name() {
		return company_Name;
	}

	public void setCompany_Name(String company_Name) {
		this.company_Name = company_Name;
	}

	public String getCompany_Situation() {
		return company_Situation;
	}

	public void setCompany_Situation(String company_Situation) {
		this.company_Situation = company_Situation;
	}

	public String getCompany_Manager() {
		return company_Manager;
	}

	public void setCompany_Manager(String company_Manager) {
		this.company_Manager = company_Manager;
	}

	public String getCompany_Phone() {
		return company_Phone;
	}

	public void setCompany_Phone(String company_Phone) {
		this.company_Phone = company_Phone;
	}

	public String getCompany_Address() {
		return company_Address;
	}

	public void setCompany_Address(String company_Address) {
		this.company_Address = company_Address;
	}

 
}