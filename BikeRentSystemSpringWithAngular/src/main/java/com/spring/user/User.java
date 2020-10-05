package com.spring.user;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.spring.utils.PasswordUtil;

@Entity
public class User implements Serializable{

	@Id
	private String userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhoneNo;
	private String userAddress;

	public User() {
	}

	public User(String userId, String userName, String userEmail, String userPassword, String userPhoneNo,
			String userAddress) {
		super();
		this.userId = userId;
		commonConstructorMethod(userName, userEmail, userPassword, userPhoneNo, userAddress);
	}

	private void commonConstructorMethod(String userName, String userEmail, String userPassword, String userPhoneNo,
			String userAddress) {
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = PasswordUtil.passwordHashing(userPassword);
		this.userPhoneNo = userPhoneNo;
		this.userAddress = userAddress;
	}

	public User(String userName, String userEmail, String userPassword, String userPhoneNo, String userAddress) {
		super();
		commonConstructorMethod(userName, userEmail, userPassword, userPhoneNo, userAddress);
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhoneNo=" + userPhoneNo + ", userAddress=" + userAddress + "]";
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhoneNo() {
		return userPhoneNo;
	}

	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
}