package com.yr.lize.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SystemStaff {
    private Integer staff_Id;

    private String staff_Number;

    private String staff_Password;

    private String staff_Name;

    private String staff_Sex;

    private Integer staff_Age;

    private String department_Id;

    private Integer company_Id;

    private Integer position_Id;

    private String staff_Phone;

    private String staff_Email;

    private Date staff_Birthday;

    private Date join_Date;

    private String staff_Identity;
    
    private Integer staff_Role;
    
    private String staff_Address;
    
    private Integer staff_State;
    
    private Integer staff_Superior;
    
    private Integer staff_Idture;
    
    private String dingding_staffid;

    private Integer apply_LevelState;
    private Integer apply_delectLevelState;
    
	public Integer getApply_delectLevelState() {
		return apply_delectLevelState;
	}


	public void setApply_delectLevelState(Integer apply_delectLevelState) {
		this.apply_delectLevelState = apply_delectLevelState;
	}


	public Integer getApply_LevelState() {
		return apply_LevelState;
	}


	public void setApply_LevelState(Integer apply_LevelState) {
		this.apply_LevelState = apply_LevelState;
	}


	public String getDingding_staffid() {
		return dingding_staffid;
	}


	public void setDingding_staffid(String dingding_staffid) {
		this.dingding_staffid = dingding_staffid;
	}


	public Integer getStaff_Idture() {
		return staff_Idture;
	}


	public void setStaff_Idture(Integer staff_Idture) {
		this.staff_Idture = staff_Idture;
	}


	public String getStaff_Address() {
		return staff_Address;
	}


	public void setStaff_Address(String staff_Address) {
		this.staff_Address = staff_Address;
	}


	public Integer getStaff_State() {
		return staff_State;
	}


	public void setStaff_State(Integer staff_State) {
		this.staff_State = staff_State;
	}


	public Integer getStaff_Superior() {
		return staff_Superior;
	}
    

	public Integer getStaff_Role() {
		return staff_Role;
	}


	public void setStaff_Role(Integer staff_Role) {
		this.staff_Role = staff_Role;
	}


	public void setStaff_Superior(Integer staff_Superior) {
		this.staff_Superior = staff_Superior;
	}


	public Integer getStaff_Id() {
		return staff_Id;
	}

	public void setStaff_Id(Integer staff_Id) {
		this.staff_Id = staff_Id;
	}

	public String getStaff_Number() {
		return staff_Number;
	}

	public void setStaff_Number(String staff_Number) {
		this.staff_Number = staff_Number;
	}

	public String getStaff_Password() {
		return staff_Password;
	}

	public void setStaff_Password(String staff_Password) {
		this.staff_Password = staff_Password;
	}

	public String getStaff_Name() {
		return staff_Name;
	}

	public void setStaff_Name(String staff_Name) {
		this.staff_Name = staff_Name;
	}

	public String getStaff_Sex() {
		return staff_Sex;
	}

	public void setStaff_Sex(String staff_Sex) {
		this.staff_Sex = staff_Sex;
	}

	public Integer getStaff_Age() {
		return staff_Age;
	}

	public void setStaff_Age(Integer staff_Age) {
		this.staff_Age = staff_Age;
	}

	public String getDepartment_Id() {
		return department_Id;
	}


	public void setDepartment_Id(String department_Id) {
		this.department_Id = department_Id;
	}


	public Integer getCompany_Id() {
		return company_Id;
	}

	public void setCompany_Id(Integer company_Id) {
		this.company_Id = company_Id;
	}

	public Integer getPosition_Id() {
		return position_Id;
	}

	public void setPosition_Id(Integer position_Id) {
		this.position_Id = position_Id;
	}

	public String getStaff_Phone() {
		return staff_Phone;
	}

	public void setStaff_Phone(String staff_Phone) {
		this.staff_Phone = staff_Phone;
	}

	public String getStaff_Email() {
		return staff_Email;
	}

	public void setStaff_Email(String staff_Email) {
		this.staff_Email = staff_Email;
	}

	public Date getStaff_Birthday() {
		return staff_Birthday;
	}

	public void setStaff_Birthday(String staff_Birthday) {
		 SimpleDateFormat aDate= new SimpleDateFormat("yyyy-MM-dd");
			
		  Date date = null;
		try {
			if (!"".equals(staff_Birthday)) {
				date = aDate.parse(staff_Birthday);
			}
			this.staff_Birthday =date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Date getJoin_Date() {
		return join_Date;
	}

	public void setJoin_Data(String join_Date) {
		SimpleDateFormat aDate= new SimpleDateFormat("yyyy-MM-dd");
		
		  Date date = null;
		  System.err.println("入职时间:"+join_Date);
		try {
			if (!"".equals(join_Date)) {
				date = aDate.parse(join_Date);
			}
			
			this.join_Date =date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getStaff_Identity() {
		return staff_Identity;
	}

	public void setStaff_Identity(String staff_Identity) {
		this.staff_Identity = staff_Identity;
	}

	
  
}