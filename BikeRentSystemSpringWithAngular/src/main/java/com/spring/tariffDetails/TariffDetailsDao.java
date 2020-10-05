package com.spring.tariffDetails;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.spring.tariff.Tariff;
import com.spring.user.User;

public class TariffDetailsDao {

	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public TariffDetails insert(TariffDetails td) {
		String id = UUID.randomUUID().toString();
		// creating Entity class object to create entity kind in datastore
		Entity e = new Entity("TariffDetails", id);
		
		if (syncCache.contains(id)) {
			List<TariffDetails> list = (List<TariffDetails>) syncCache.get(id);
			list.add(td);
			syncCache.put(id, list);

		} else {
			List<TariffDetails> list = retrieveTariffDetails(id);
			list.add(td);
			syncCache.put(id, list);
		}
		
		e.setProperty("tariffDetailsId", id);
		e.setProperty("tariffId", td.getTariffId());
		e.setProperty("tariffDurationHours", td.getTariffDurationHours());
		e.setProperty("tariffAmount", td.getTariffAmount());
		e.setProperty("tariffRideLimitInKM", td.getTariffRideLimitInKM());
		e.setProperty("afterLimitAmountPerHour", td.getAfterLimitAmountPerHour());
		e.setProperty("afterLimitKM", td.getAfterLimitKM());
		Key key = ds.put(e);
		System.out.println(key);
 
		return td;
	}

	public TariffDetails update(TariffDetails td, String id) {
		// creating Entity class object to create entity kind in datastore
		Entity e = new Entity("TariffDetails", id);
		e.setProperty("tariffDetailsId", id);
		e.setProperty("tariffId", td.getTariffId());
		e.setProperty("tariffDurationHours", td.getTariffDurationHours());
		e.setProperty("tariffAmount", td.getTariffAmount());
		e.setProperty("tariffRideLimitInKM", td.getTariffRideLimitInKM());
		e.setProperty("afterLimitAmountPerHour", td.getAfterLimitAmountPerHour());
		e.setProperty("afterLimitKM", td.getAfterLimitKM());
		Key key = ds.put(e);
		System.out.println(key);
		
		return td;
	}

	public List<TariffDetails> retrieveTariffDetails(String tariffDetailsId) {
		List<TariffDetails> list = new ArrayList<TariffDetails>();
		TariffDetails td = new TariffDetails();

		if (syncCache.contains(tariffDetailsId)) {
			return (List<TariffDetails>) syncCache.get(tariffDetailsId);
		} else {
			// Query object for fetching the data from datastore
			Query q = new Query("TariffDetails").addFilter("tariffDetailsId", FilterOperator.EQUAL, tariffDetailsId);
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				td.setTariffDetailsId(e.getProperty("tariffDetailsId").toString());
				td.setTariffId(e.getProperty("tariffId").toString());
			    td.setTariffDurationHours(Integer.parseInt(e.getProperty("tariffDurationHours").toString()));
				td.setTariffAmount(Double.parseDouble(e.getProperty("tariffAmount").toString()));
				td.setTariffRideLimitInKM(Integer.parseInt(e.getProperty("tariffRideLimitInKM").toString()));
				td.setAfterLimitAmountPerHour(Double.parseDouble(e.getProperty("afterLimitAmountPerHour").toString()));
				td.setAfterLimitKM(Integer.parseInt(e.getProperty("afterLimitKM").toString()));
			}

			list.add(td);
			syncCache.put(tariffDetailsId, list);
		}

		return list;
	}
	
	public void deleteTariffDetailsById(String tariffDetailsId) {
		if(syncCache.contains(tariffDetailsId)) {
			syncCache.delete(tariffDetailsId);
		}
		Key key = KeyFactory.createKey("TariffDetails", tariffDetailsId);
		ds.delete(key);
	}

}
