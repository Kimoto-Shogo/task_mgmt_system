package model.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class TaskBean {

	private int task_id;
	private String task_name;
	private int category_id;
	private Date limit_date;
	private String user_id;
	private String status_code;
	private String memo;
	private Timestamp create_datetime;
	private Timestamp update_datetime; //データ型はインポート
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public Date getLimit_date() {
		return limit_date;
	}
	public void setLimit_date(Date limit_date) {
		this.limit_date = limit_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStatus_code() {
		return status_code;
	}
	public void setStatus_code(String status_code) {
		this.status_code = status_code;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Timestamp getCreate_datetime() {
		return create_datetime;
	}
	public void setCreate_datetime(Timestamp create_datetime) {
		this.create_datetime = create_datetime;
	}
	public Timestamp getUpdate_datetime() {
		return update_datetime;
	}
	public void setUpdate_datetime(Timestamp update_datetime) {
		this.update_datetime = update_datetime;
	}
	
	
}
