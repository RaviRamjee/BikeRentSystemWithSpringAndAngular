package com.spring.tariff;

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
import com.spring.user.User;

public class TariffDao {
	
	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	// getting datastore service
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		public Tariff insert(Tariff t) {
			String id= UUID.randomUUID().toString();
			// creating Entity class object to create entity kind in datastore
			Entity e = new Entity("Tariff",id);
			
			if (syncCache.contains(id)) {
				List<Tariff> list = (List<Tariff>) syncCache.get(id);
				list.add(t);
				syncCache.put(id, list);

			} else {
				List<Tariff> list = retrieveTariff(id);
				list.add(t);
				syncCache.put(id, list);
			}

			e.setProperty("tariffId",id);
			e.setProperty("tariffName", t.getTariffName());
			e.setProperty("tariffDescription",t.getTariffDescription());
			e.setProperty("tariffStatus", t.getTariffStatus());
			Key key = ds.put(e);
			System.out.println("key======================================="+key);
			return t;

		}
		
		public Tariff update(Tariff t,String id) {
		
			// creating Entity class object to create entity kind in datastore
			Entity e = new Entity("Tariff",id);

			e.setProperty("tariffId",id);
			e.setProperty("tariffName", t.getTariffName());
			e.setProperty("tariffDescription",t.getTariffDescription());
			e.setProperty("tariffStatus", t.getTariffStatus());
			Key key = ds.put(e);
			System.out.println(key);
            
			return t;
		}
		
		public List<Tariff> retrieveTariff(String tariffId) {
			List<Tariff> list = new ArrayList<Tariff>();
			Tariff tariff = new Tariff();

			if (syncCache.contains(tariffId)) {
				return (List<Tariff>) syncCache.get(tariffId);
			} else {
				// Query object for fetching the data from datastore
				Query q = new Query("Tariff").addFilter("tariffId", FilterOperator.EQUAL, tariffId);
				PreparedQuery pq = ds.prepare(q);
				for (Entity e : pq.asIterable()) {
					tariff.setTariffId(e.getProperty("tariffId").toString());
					tariff.setTariffName(e.getProperty("tariffName").toString());
					tariff.setTariffDescription(e.getProperty("tariffDescription").toString());
					tariff.setTariffstatus(e.getProperty("tariffStatus").toString());
				}

				list.add(tariff);
				syncCache.put(tariffId, list);
			}

			return list;
		}
		

		public Key deleteTariffById(String tariffId) {
			if(syncCache.contains(tariffId)) {
				syncCache.delete(tariffId);
			}
			Key key = KeyFactory.createKey("Tariff", tariffId);
			ds.delete(key);
			
			return key;
		}
}
