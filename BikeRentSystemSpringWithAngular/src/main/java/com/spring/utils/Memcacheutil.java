package com.spring.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.spring.user.User;

public class Memcacheutil {
	
	/**MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public <T> T insert(T t) {
		String id = UUID.randomUUID().toString();
		// creating Entity class object to create entity kind in datastore
		Entity e = new Entity("User", id);

		if (syncCache.contains(id)) {
			List<T> list = (List<T>) syncCache.get(id);
			list.add(t);
			syncCache.put(id, list);

		} else {
			
			List<T> list = (List<T>) retrieveUser(t,id);
			list.add(t);
			syncCache.put(id, list);
		}

		GenericClass<T> gc=new GenericClass<T>();
		t=(T)gc.get();
		return t;
	}

	public <T> List<T>  retrieveUser(T t,String userId) {
		List<T> list = new ArrayList<T>();
		User u = new User();

		if (syncCache.contains(userId)) {
			return (List<T>) syncCache.get(userId);
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

			//list.add(u);
			syncCache.put(userId, list);
		}

		return list;
	}*/
}
