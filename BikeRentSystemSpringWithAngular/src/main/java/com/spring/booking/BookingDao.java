package com.spring.booking;

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
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.spring.tariff.Tariff;
import com.spring.user.User;

public class BookingDao {

	MemcacheService syncCache = MemcacheServiceFactory.getMemcacheService();

	User user = new User();

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	public Booking insert(Booking booking) {
		String id = UUID.randomUUID().toString();

		// Add the task to the default queue.
		Queue queue = QueueFactory.getQueue("booking-queue");
		queue.add(TaskOptions.Builder.withUrl("/book-queue").param("bookingId", id));

		// creating Entity class object to create entity kind in datastore
		Entity e = new Entity("Booking", id);

		if (syncCache.contains(id)) {
			List<Booking> list = (List<Booking>) syncCache.get(id);
			list.add(booking);
			syncCache.put(id, list);

		} else {
			List<Booking> list = retrieveBooking(id);
			list.add(booking);
			syncCache.put(id, list);
		}

		e.setProperty("bookingId", id);
		e.setProperty("bookingUserId", booking.getBookingUserId());
		e.setProperty("bookingBikeId", booking.getBookingBikeId());
		e.setProperty("bookingName", booking.getBookingName());
		e.setProperty("bookingBranch", booking.getBookingBranch());
		e.setProperty("bookingDLNo", booking.getBookingDLNo());
		e.setProperty("bookingPickupDate", booking.getBookingPickupDate());
		e.setProperty("bookingPickupTime", booking.getBookingPickupTime());
		e.setProperty("bookingDropDate", booking.getBookingDropDate());
		e.setProperty("bookingDropTime", booking.getBookingDropTime());
		e.setProperty("bookingStatus", booking.getBookingStatus());
		e.setProperty("bookingTariffSelected", booking.getBookingTariffSelected());
		e.setProperty("bookingTime", booking.getBookingTime());
		Key key = ds.put(e);
		System.out.println(key);

		return booking;

	}

	public List<Booking> retrieveBooking(String bookingId) {
		List<Booking> list = new ArrayList<Booking>();
		Booking book = new Booking();

		if (syncCache.contains(bookingId)) {
			return (List<Booking>) syncCache.get(bookingId);
		} else {
			// Query object for fetching the data from datastore
			Query q = new Query("Booking").addFilter("bookingId", FilterOperator.EQUAL, bookingId);
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				book.setBookingId(e.getProperty("bookingId").toString());
				book.setBookingBikeId(e.getProperty("bookingBikeId").toString());
				book.setBookingName(e.getProperty("bookingName").toString());
				book.setBookingBranch(e.getProperty("bookingBranch").toString());
				book.setBookingDLNo(e.getProperty("bookingDLNo").toString());
				book.setBookingPickupDate(e.getProperty("bookingPickupDate").toString());
				book.setBookingPickupTime(e.getProperty("bookingPickupTime").toString());
				book.setBookingDropDate(e.getProperty("bookingDropDate").toString());
				book.setBookingDropTime(e.getProperty("bookingDropTime").toString());
				book.setBookingStatus(e.getProperty("bookingStatus").toString());
				book.setBookingTariffSelected(e.getProperty("bookingTariffSelected").toString());
				book.setBookingTime(e.getProperty("bookingTime").toString());
			}

			list.add(book);
			syncCache.put(bookingId, list);
		}

		return list;
	}

	public void deleteBookingByBookingId(String bookingId) {
		if (syncCache.contains(bookingId)) {
			syncCache.delete(bookingId);
		}

		Entity e = new Entity("Booking", bookingId);
		e.setProperty("bookingStatus", "cancelled");
		ds.put(e);

		Key key = KeyFactory.createKey("Bike", bookingId);
		ds.delete(key);
	}

}
