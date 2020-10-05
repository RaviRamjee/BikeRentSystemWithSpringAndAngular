package com.spring.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.spring.booking.Booking;
import com.spring.user.User;

public class BookingTest {

	@Test
	public void test() {

		// setting class object
		Booking booking = new Booking();

		// setter method for set the booking data
		booking.setBookingUserId("hfdhf7863kjhjj");
		booking.setBookingBikeId("fdkjhf89799fhd");
		booking.setBookingName("Rajesh");
		booking.setBookingBranch("BTM Layout");
		booking.setBookingDLNo("HFHD6876DJKFKJHD");
		booking.setBookingPickupDate("23-Sept-2020");
		booking.setBookingPickupTime("09:00");
		booking.setBookingDropDate("24-Sept-2020");
		booking.setBookingDropTime("20:00");
		booking.setBookingStatus("booked");
		booking.setBookingTariffSelected("jf97slkjlkd9879");
		booking.setBookingTime("23-Sept-2020 09:00 AM");

		/**
		 * Asserts that two objects are equal. If they are not, an AssertionError
		 * without a message is thrown. If expected and actualare null, they are
		 * considered equal.
		 */
		assertEquals("hfdhf7863kjhjj", booking.getBookingUserId());
		assertEquals("fdkjhf89799fhd", booking.getBookingBikeId());
		assertEquals("Rajesh", booking.getBookingName());
		assertEquals("BTM Layout", booking.getBookingBranch());
		assertEquals("HFHD6876DJKFKJHD", booking.getBookingDLNo());
		assertEquals("23-Sept-2020", booking.getBookingPickupDate());
		assertEquals("09:00", booking.getBookingPickupTime());
		assertEquals("24-Sept-2020", booking.getBookingDropDate());
		assertEquals("20:00", booking.getBookingDropTime());
		assertEquals("booked", booking.getBookingStatus());
		assertEquals("jf97slkjlkd9879", booking.getBookingTariffSelected());
		assertEquals("23-Sept-2020 09:00 AM", booking.getBookingTime());

		// if it will be null then throw AssertionError
		assertNotNull(booking.getBookingName());
		assertNotNull(booking.getBookingBranch());
	}

}
