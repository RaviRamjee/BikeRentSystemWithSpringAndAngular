package com.spring.test;

import static org.junit.Assert.*;
import org.junit.Test;

import com.spring.user.User;
import com.spring.user.UserDao;

public class UserDataTest {

	@Test
	public void test() {
		
		//getting user class object
		User user=new User();

		//setter method for set the user data
		user.setUserId("7jhsfhs73647js");
		user.setUserName("Samrat Kumar");
		user.setUserEmail("samrat@gmail.com");
		user.setUserPassword("sam12345");
		user.setUserPhoneNo("9884637477");
		user.setUserAddress("Banglore");
		
		/**
		  Asserts that two objects are equal. If they are not, an AssertionError without a message is thrown.
		  If expected and actualare null, they are considered equal.
		 */
		assertEquals("7jhsfhs73647js",user.getUserId());
		assertEquals("Samrat Kumar",user.getUserName());
		assertEquals("samrat@gmail.com",user.getUserEmail());
		assertEquals("sam12345",user.getUserPassword());
		assertEquals("9884637477",user.getUserPhoneNo());
		assertEquals("Banglore",user.getUserAddress());
		
		//if it will be null then throw AssertionError
		assertNotNull(user.getUserName());
		assertNotNull(user.getUserEmail());
	}

}
