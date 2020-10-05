package com.spring.tariff;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.spring.utils.PasswordUtil;

@Entity
public class Tariff implements Serializable {

	@Id
	String tariffId;
	String tariffName;
	String tariffDescription;
	String tariffStatus;

	public Tariff() {
	}

	public Tariff(String tariffId, String tariffName, String tariffDescription, String tariffStatus) {
		super();
		this.tariffId = tariffId;
		commonConstructorMethod(tariffName, tariffDescription, tariffStatus);
	}

	private void commonConstructorMethod(String tariffName, String tariffDescription, String tariffStatus) {

		this.tariffName = tariffName;
		this.tariffDescription = tariffDescription;
		this.tariffStatus = tariffStatus;
	}

	public Tariff(String tariffName, String tariffDescription, String tariffStatus) {
		super();
		commonConstructorMethod(tariffName, tariffDescription, tariffStatus);
	}

	@Override
	public String toString() {
		return "Tariff [tariffId=" + tariffId + ", tariffName=" + tariffName + ", tariffDescription="
				+ tariffDescription + ", tariffstatus=" + tariffStatus + "]";
	}

	public String getTariffId() {
		return tariffId;
	}

	public void setTariffId(String tariffId) {
		this.tariffId = tariffId;
	}

	public String getTariffName() {
		return tariffName;
	}

	public void setTariffName(String tariffName) {
		this.tariffName = tariffName;
	}

	public String getTariffDescription() {
		return tariffDescription;
	}

	public void setTariffDescription(String tariffDescription) {
		this.tariffDescription = tariffDescription;
	}

	public String getTariffStatus() {
		return tariffStatus;
	}

	public void setTariffstatus(String tariffStatus) {
		this.tariffStatus = tariffStatus;
	}

}
