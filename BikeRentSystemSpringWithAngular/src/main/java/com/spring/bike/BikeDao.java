package com.spring.bike;

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

public class BikeDao {

	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();
	
	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public Bike insert(Bike bike) {

		// creating Entity class object for creating entity kind in datastore
		String id = UUID.randomUUID().toString();
		Entity e = new Entity("Bike", id);
		
		if (syncCache.contains(id)) {
			List<Bike> list = (List<Bike>) syncCache.get(id);
			list.add(bike);
			syncCache.put(id, list);

		} else {
			List<Bike> list = retrieveBike(id);
			list.add(bike);
			syncCache.put(id, list);
		}

		// setting property for "Entity" with the of getter method
		e.setProperty("bikeId", id);
		e.setProperty("tariffId", bike.getTariffId());
		e.setProperty("bikeName", bike.getBikeName());
		e.setProperty("bikeDescription", bike.getBikeDescription());
		e.setProperty("bikeCategory", bike.getBikeCategory());
		e.setProperty("bikeCompany", bike.getBikeCompany());
		e.setProperty("bikeModel", bike.getBikeModel());
		e.setProperty("bikeRCNo", bike.getBikeRCNo());
		e.setProperty("bikeRCName", bike.getBikeRCName());
		e.setProperty("bikeRCRegDate", bike.getBikeRCRegDate());
		e.setProperty("bikeRCExpDate", bike.getBikeRCExpDate());
		e.setProperty("bikeRCCHNO", bike.getBikeRCCHNO());
		e.setProperty("bikeRCEnginNo", bike.getBikeRCEnginNo());
		e.setProperty("bikeYearMfg", bike.getBikeYearMfg());
		e.setProperty("bikeNoOfGear", bike.getBikeNoOfGear());
		e.setProperty("bikeColor", bike.getBikeColor());
		e.setProperty("selfStart", bike.getSelfstart());
		e.setProperty("bikeEnginCC", bike.getBikeEnginCC());
		e.setProperty("status", bike.getStatus());
		e.setProperty("bikeImage", bike.getBikeImage());

		ds.put(e);
		
		return bike;
	}
	
	public Bike update(Bike bike,String id) {

		// creating Entity class object for creating entity kind in datastore
		Entity e = new Entity("Bike", id);

		// setting property for "Entity" with the of getter method
		e.setProperty("bikeId", id);
		e.setProperty("tariffId", bike.getTariffId());
		e.setProperty("bikeName", bike.getBikeName());
		e.setProperty("bikeDescription", bike.getBikeDescription());
		e.setProperty("bikeCategory", bike.getBikeCategory());
		e.setProperty("bikeCompany", bike.getBikeCompany());
		e.setProperty("bikeModel", bike.getBikeModel());
		e.setProperty("bikeRCNo", bike.getBikeRCNo());
		e.setProperty("bikeRCName", bike.getBikeRCName());
		e.setProperty("bikeRCRegDate", bike.getBikeRCRegDate());
		e.setProperty("bikeRCExpDate", bike.getBikeRCExpDate());
		e.setProperty("bikeRCCHNO", bike.getBikeRCCHNO());
		e.setProperty("bikeRCEnginNo", bike.getBikeRCEnginNo());
		e.setProperty("bikeYearMfg", bike.getBikeYearMfg());
		e.setProperty("bikeNoOfGear", bike.getBikeNoOfGear());
		e.setProperty("bikeColor", bike.getBikeColor());
		e.setProperty("selfStart", bike.getSelfstart());
		e.setProperty("bikeEnginCC", bike.getBikeEnginCC());
		e.setProperty("status", bike.getStatus());
		e.setProperty("bikeImage", bike.getBikeImage());

		ds.put(e);
		
		return bike;
	}
	
	public List<Bike> retrieveBike(String bikeId) {
		List<Bike> list = new ArrayList<Bike>();
		Bike bike = new Bike();

		if (syncCache.contains(bikeId)) {
			return (List<Bike>) syncCache.get(bikeId);
		} else {
			// Query object for fetching the data from datastore
			Query q = new Query("Bike").addFilter("bikeId", FilterOperator.EQUAL, bikeId);
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				bike.setBikeId(e.getProperty("bikeId").toString());
				bike.setTariffId(e.getProperty("tariffId").toString());
				bike.setBikeName(e.getProperty("bikeName").toString());
				bike.setBikeDescription(e.getProperty("bikeDescription").toString());
				bike.setBikeCategory(e.getProperty("bikeCategory").toString());
				bike.setBikeModel(e.getProperty("bikeModel").toString());
				bike.setBikeRCNo(e.getProperty("bikeRCNo").toString());
				bike.setBikeRCName(e.getProperty("bikeRCName").toString());
				bike.setBikeRCRegDate(e.getProperty("bikeRCRegDate").toString());
				bike.setBikeRCExpDate(e.getProperty("bikeRCExpDate").toString());
				bike.setBikeRCCHNO(e.getProperty("bikeRCCHNO").toString());
				bike.setBikeRCEnginNo(e.getProperty("bikeRCEnginNo").toString());
				bike.setBikeYearMfg(e.getProperty("bikeYearMfg").toString());
				bike.setBikeNoOfGear(Integer.parseInt(e.getProperty("bikeNoOfGear").toString()));
				bike.setBikeColor(e.getProperty("bikeColor").toString());
				bike.setSelfstart(Integer.parseInt(e.getProperty("selfStart").toString()));
				bike.setBikeEnginCC(Integer.parseInt( e.getProperty("bikeEnginCC").toString()));
				bike.setStatus(Integer.parseInt(e.getProperty("status").toString()));
				bike.setBikeImage(e.getProperty("bikeImage").toString());
			}

			list.add(bike);
			syncCache.put(bikeId, list);
		}

		return list;
	}
	

	public void deleteBikeByBikeId(String bikeId) {
		if(syncCache.contains(bikeId)) {
			syncCache.delete(bikeId);
		}
		Key key = KeyFactory.createKey("Bike", bikeId);
		ds.delete(key);
	}

}
