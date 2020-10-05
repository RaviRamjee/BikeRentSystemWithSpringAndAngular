package com.spring.user;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.VoidWork;

public class UserDao {

	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public User insert(User u) {
		String id = UUID.randomUUID().toString();
		// creating Entity class object to create entity kind in datastore
		Entity e = new Entity("User", id);

		if (syncCache.contains(id)) {
			List<User> list = (List<User>) syncCache.get(id);
			list.add(u);
			syncCache.put(id, list);

		} else {
			List<User> list = retrieveUser(id);
			list.add(u);
			syncCache.put(id, list);
		}

		e.setProperty("userId", id);
		e.setProperty("userName", u.getUserName());
		e.setProperty("userEmail", u.getUserEmail());
		e.setProperty("userPassword", u.getUserPassword());
		e.setProperty("userPhone", u.getUserPhoneNo());
		e.setProperty("userAddress", u.getUserAddress());
		Key key = ds.put(e);
		System.out.println(key);

		return u;
	}
	
	/**public User add(User u,String id)
	{
		Entity e = new Entity("User", id);
		e.setProperty("userId", id);
		e.setProperty("userName", u.getUserName());
		e.setProperty("userEmail", u.getUserEmail());
		e.setProperty("userPassword", u.getUserPassword());
		e.setProperty("userPhone", u.getUserPhoneNo());
		e.setProperty("userAddress", u.getUserAddress());
		Key key = ds.put(e);
		System.out.println(key);

		return u;
	}
*/
	public String getUserIdByEmail(String email) {
		String userId = "";
		// Query object for fetching the data from datastore
		Query q = new Query("User").addFilter("userEmail", FilterOperator.EQUAL, email);
		PreparedQuery pq = ds.prepare(q);
		for (Entity e : pq.asIterable()) {
			userId = e.getProperty("userId").toString();
		}
		return userId;
	}

	public List<User> retrieveUser(String userId) {
		List<User> list = new ArrayList<User>();
		User u = new User();

		if (syncCache.contains(userId)) {
			return (List<User>) syncCache.get(userId);
		} else {
			// Query object for fetching the data from datastore
			Query q = new Query("User").addFilter("userId", FilterOperator.EQUAL, userId);
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				u.setUserId(e.getProperty("userId").toString());
				u.setUserName(e.getProperty("userName").toString());
				u.setUserEmail(e.getProperty("userEmail").toString());
				u.setUserPassword(e.getProperty("userPassword").toString());
				u.setUserPhoneNo(e.getProperty("userPhone").toString());
				u.setUserAddress(e.getProperty("userAddress").toString());
			}

			list.add(u);
			syncCache.put(userId, list);
		}

		return list;
	}
}
