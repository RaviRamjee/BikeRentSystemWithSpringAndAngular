package com.spring.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.spring.tariff.Tariff;
import com.spring.user.User;

public class TariffTest {

	@Test
	public void test() {
		// getting Tariff class object
		Tariff tariff = new Tariff();

		// setter method for set the tariff data
		tariff.setTariffId("hf78khi9yw39");
		tariff.setTariffName("100CC");
		tariff.setTariffDescription("included basic vehicles like activa,splender etc");
		tariff.setTariffstatus("active");

		/**
		 * Asserts that two objects are equal. If they are not, an AssertionError
		 * without a message is thrown. If expected and actualare null, they are
		 * considered equal.
		 */
		assertEquals("hf78khi9yw39", tariff.getTariffId());
		assertEquals("100CC", tariff.getTariffName());
		assertEquals("included basic vehicles like activa,splender etc", tariff.getTariffDescription());
		assertEquals("active", tariff.getTariffStatus());

		// if it will be null then throw AssertionError
		assertNotNull(tariff.getTariffName());
		assertNotNull(tariff.getTariffDescription());
	}

}
