/**StatusBean.java
 * model.entity.StatusBean.java
 */
package model.entity;

/**ステータス情報を表します。
 * TaskRegisterのDTOであり、Beanオブジェクトです。
 * @author 木本
 */
public class StatusBean {
	private String status_code;
	private String status_name;
	
	public String getStatus_code() {
		return status_code;
	}
	public void setStatus_code(String status_code) {
		this.status_code = status_code;
	}
	
	
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
}
