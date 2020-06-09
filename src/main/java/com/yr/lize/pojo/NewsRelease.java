package com.yr.lize.pojo;

import java.util.Date;

public class NewsRelease {
    private Integer news_Id;

    private String news_Title;

    private Integer newsfile_Id;

    private Integer staff_Id;

    private Date news_Adddate;

    private String news_Text;

	public Integer getNews_Id() {
		return news_Id;
	}

	public void setNews_Id(Integer news_Id) {
		this.news_Id = news_Id;
	}

	public String getNews_Title() {
		return news_Title;
	}

	public void setNews_Title(String news_Title) {
		this.news_Title = news_Title;
	}

	public Integer getNewsfile_Id() {
		return newsfile_Id;
	}

	public void setNewsfile_Id(Integer newsfile_Id) {
		this.newsfile_Id = newsfile_Id;
	}

	public Integer getStaff_Id() {
		return staff_Id;
	}

	public void setStaff_Id(Integer staff_Id) {
		this.staff_Id = staff_Id;
	}

	public Date getNews_Adddate() {
		return news_Adddate;
	}

	public void setNews_Adddate(Date news_Adddate) {
		this.news_Adddate = news_Adddate;
	}

	public String getNews_Text() {
		return news_Text;
	}

	public void setNews_Text(String news_Text) {
		this.news_Text = news_Text;
	}

   
}