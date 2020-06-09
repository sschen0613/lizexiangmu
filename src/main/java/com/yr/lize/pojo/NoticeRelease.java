package com.yr.lize.pojo;

import java.util.Date;

public class NoticeRelease {
    private Integer notice_Id;

    private String notice_Title;

    private Integer noticefile_Id;

    private Integer staff_Id;

    private Date notice_Adddate;

    private String notice_Text;

	public Integer getNotice_Id() {
		return notice_Id;
	}

	public void setNotice_Id(Integer notice_Id) {
		this.notice_Id = notice_Id;
	}

	public String getNotice_Title() {
		return notice_Title;
	}

	public void setNotice_Title(String notice_Title) {
		this.notice_Title = notice_Title;
	}

	public Integer getNoticefile_Id() {
		return noticefile_Id;
	}

	public void setNoticefile_Id(Integer noticefile_Id) {
		this.noticefile_Id = noticefile_Id;
	}

	public Integer getStaff_Id() {
		return staff_Id;
	}

	public void setStaff_Id(Integer staff_Id) {
		this.staff_Id = staff_Id;
	}

	public Date getNotice_Adddate() {
		return notice_Adddate;
	}

	public void setNotice_Adddate(Date notice_Adddate) {
		this.notice_Adddate = notice_Adddate;
	}

	public String getNotice_Text() {
		return notice_Text;
	}

	public void setNotice_Text(String notice_Text) {
		this.notice_Text = notice_Text;
	}


}