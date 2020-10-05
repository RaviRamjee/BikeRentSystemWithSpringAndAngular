package com.spring.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.spring.bike.Bike;

public class BikeTest {

	@Test
	public void test() {

		Bike bike = new Bike();
		// setter methods for set value
		bike.setBikeName("Pulsar 150");
		bike.setBikeDescription("it has 150cc engine with 4 stroke");
		bike.setBikeCategory("city bike");
		bike.setBikeCompany("Bajaj");
		bike.setBikeModel("2016");
		bike.setBikeRCNo("JHAKH7886876");
		bike.setBikeRCName("Samrat");
		bike.setBikeRCRegDate("22-04-2016");
		bike.setBikeRCExpDate("12-06-2024");

		/**
		 * Asserts that two objects are equal. If they are not, an AssertionError
		 * without a message is thrown. If expected and actualare null, they are
		 * considered equal.
		 */
		assertEquals("Pulsar 150", bike.getBikeName());
		assertEquals("it has 150cc engine with 4 stroke", bike.getBikeDescription());
		assertEquals("city bike", bike.getBikeCategory());
		assertEquals("Bajaj", bike.getBikeCompany());
		assertEquals("2016", bike.getBikeModel());
		assertEquals("JHAKH7886876", bike.getBikeRCNo());
		assertEquals("Samrat", bike.getBikeRCName());
		assertEquals("22-04-2016", bike.getBikeRCRegDate());
		assertEquals("12-06-2024", bike.getBikeRCExpDate());

		// if it will be null then throw AssertionError
		assertNotNull(bike.getBikeName());
		assertNotNull(bike.getBikeCompany());
	}

}
