package model.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class CommentBean {
	
	private int task_id;
	private String task_name;
	private int category_id;
	private Date limit_date;
	private String user_id;
	private String status_code;
	private String memo;
	private Timestamp create_datetime;
	private Timestamp update_datetime; //データ型はインポート
	private String category_name;
	private String user_name;
	private String status_name;
	private int comment_id;
	private String comment;

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
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getUpdate_datetime() {
		return update_datetime;
	}
	public void setUpdate_datetime(Timestamp update_datetime) {
		this.update_datetime = update_datetime;
	}
	
	
}
