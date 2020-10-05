package com.spring.tariffDetails;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.spring.utils.PasswordUtil;

@Entity
public class TariffDetails implements Serializable{

	@Id
	String tariffDetailsId;
	String tariffId;
	int tariffDurationHours;
	double tariffAmount;
	int tariffRideLimitInKM;
	double afterLimitAmountPerHour;
	int afterLimitKM;

	public TariffDetails() {
	}

	public TariffDetails(String tariffDetailsId, String tariffId, int tariffDurationHours, double tariffAmount,
			int tariffRideLimitInKM, double afterLimitAmountPerHour, int afterLimitKM) {
		super();
		this.tariffDetailsId = tariffDetailsId;
		commonConstructorMethod(tariffId, tariffDurationHours, tariffAmount, tariffRideLimitInKM,
				afterLimitAmountPerHour, afterLimitKM);

	}

	private void commonConstructorMethod(String tariffId, int tariffDurationHours, double tariffAmount,
			int tariffRideLimitInKM, double afterLimitAmountPerHour, int afterLimitKM) {
		this.tariffId = tariffId;
		this.tariffDurationHours = tariffDurationHours;
		this.tariffAmount = tariffAmount;
		this.tariffRideLimitInKM = tariffRideLimitInKM;
		this.afterLimitAmountPerHour = afterLimitAmountPerHour;
		this.afterLimitKM = afterLimitKM;
	}

	public TariffDetails(String tariffId, int tariffDurationHours, double tariffAmount, int tariffRideLimitInKM,
			double afterLimitAmountPerHour, int afterLimitKM) {
		super();
		commonConstructorMethod(tariffId, tariffDurationHours, tariffAmount, tariffRideLimitInKM,
				afterLimitAmountPerHour, afterLimitKM);
	}

	@Override
	public String toString() {
		return "TariffDetails [tariffDetailsId=" + tariffDetailsId + ", tariffId=" + tariffId + ", tariffDurationHours="
				+ tariffDurationHours + ", tariffAmount=" + tariffAmount + ", tariffRideLimitInKM="
				+ tariffRideLimitInKM + ", afterLimitAmountPerHour=" + afterLimitAmountPerHour + ", afterLimitKM="
				+ afterLimitKM + "]";
	}

	public String getTariffDetailsId() {
		return tariffDetailsId;
	}

	public void setTariffDetailsId(String tariffDetailsId) {
		this.tariffDetailsId = tariffDetailsId;
	}

	public String getTariffId() {
		return tariffId;
	}

	public void setTariffId(String tariffId) {
		this.tariffId = tariffId;
	}

	public int getTariffDurationHours() {
		return tariffDurationHours;
	}

	public void setTariffDurationHours(int tariffDurationHours) {
		this.tariffDurationHours = tariffDurationHours;
	}

	public double getTariffAmount() {
		return tariffAmount;
	}

	public void setTariffAmount(double tariffAmount) {
		this.tariffAmount = tariffAmount;
	}

	public int getTariffRideLimitInKM() {
		return tariffRideLimitInKM;
	}

	public void setTariffRideLimitInKM(int tariffRideLimitInKM) {
		this.tariffRideLimitInKM = tariffRideLimitInKM;
	}

	public double getAfterLimitAmountPerHour() {
		return afterLimitAmountPerHour;
	}

	public void setAfterLimitAmountPerHour(double afterLimitAmountPerHour) {
		this.afterLimitAmountPerHour = afterLimitAmountPerHour;
	}

	public int getAfterLimitKM() {
		return afterLimitKM;
	}

	public void setAfterLimitKM(int afterLimitKM) {
		this.afterLimitKM = afterLimitKM;
	}

}
