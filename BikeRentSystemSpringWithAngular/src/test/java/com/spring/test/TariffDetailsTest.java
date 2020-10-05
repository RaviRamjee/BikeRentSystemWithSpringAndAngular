package com.spring.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.spring.tariff.Tariff;
import com.spring.tariffDetails.TariffDetails;

public class TariffDetailsTest {

	@Test
	public void test() {

		// getting TariffDetails class object
		TariffDetails td = new TariffDetails();

		// setter method for set the tariffDetails data
		td.setTariffDetailsId("kj8678hfkd8hfjhh");
		td.setTariffId("hfhd768778sjhkhk");
		td.setTariffDurationHours(24);
		td.setTariffRideLimitInKM(80);
		td.setAfterLimitKM(10);

		/**
		 * Asserts that two objects are equal. If they are not, an AssertionError
		 * without a message is thrown. If expected and actualare null, they are
		 * considered equal.
		 */
		assertEquals("kj8678hfkd8hfjhh", td.getTariffDetailsId());
		assertEquals("hfhd768778sjhkhk", td.getTariffId());
		assertEquals(24, td.getTariffDurationHours());
		assertEquals(80, td.getTariffRideLimitInKM());
		assertEquals(10, td.getAfterLimitKM());

		// if it will be null then throw AssertionError
		assertNotNull(td.getTariffDetailsId());
		assertNotNull(td.getTariffId());
	}

}
