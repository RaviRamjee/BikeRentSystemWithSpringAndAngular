package com.spring.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;

public class UserService {

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public int regCheck(String email) {
		String userEmail = "";
		int temp = 0;

		// Query object for fetching the data from datastore
		Query q = new Query("User");
		PreparedQuery pq = ds.prepare(q);
		for (Entity e : pq.asIterable()) {
			userEmail = e.getProperty("userEmail").toString(); // getting user Email from datastore
			System.out.println("userEmail========" + userEmail);

			// comparing user's input email with datastore email
			if (email.equals(userEmail)) {
				temp = 1;
			}
		}
		return temp;
	}

	public int loginCheck(String email, String myHash) {
		String userEmail = "";
		String userPassword = "";
		int temp = 0;
		// Query object for fetching the data from datastore
		Query q = new Query("User");
		PreparedQuery pq = ds.prepare(q);
		for (Entity e : pq.asIterable()) {
			userEmail = e.getProperty("userEmail").toString();
			userPassword = e.getProperty("userPassword").toString();
			/**
			 * --> comparing user's input email and password with the datastore value. -->if
			 * temp is '1' means email and password is matching
			 */
			
			if (email.equals(userEmail) && myHash.equals(userPassword)) {
				temp = 1;
			}
		}
		return temp;
	}
	
	public void addTaskQueue(String email)
	{
		// Add the task to the default queue.
	    Queue queue = QueueFactory.getQueue("reg-queue");
	    queue.add(TaskOptions.Builder.withUrl("/reg-queue").param("email", email));
	}
}
