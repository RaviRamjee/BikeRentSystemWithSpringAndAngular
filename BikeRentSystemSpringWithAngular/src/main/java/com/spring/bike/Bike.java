package com.spring.bike;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.spring.user.UserService;

@Entity
public class Bike implements Serializable {
	@Id
	private String bikeId;
	private String tariffId;
	private String bikeName;
	private String bikeDescription;
	private String bikeCategory;
	private String bikeCompany;
	private String bikeModel;
	private String bikeRCNo;
	private String bikeRCName;
	private String bikeRCRegDate;
	private String bikeRCExpDate;
	private String bikeRCCHNO;
	private String bikeRCEnginNo;
	private String bikeYearMfg;
	private int bikeNoOfGear;
	private String bikeColor;
	private int selfstart;
	private int bikeEnginCC;
	private int status;
	private String bikeImage;

	public Bike() {
	}

	public Bike(String bikeId,String tariffId, String bikeName, String bikeDescription, String bikeCategory, String bikeCompany,
			String bikeModel, String bikeRCNo, String bikeRCName, String bikeRCRegDate, String bikeRCExpDate,
			String bikeRCCHNO, String bikeRCEnginNo, String bikeYearMfg, int bikeNoOfGear, String bikeColor,
			int selfstart, int bikeEnginCC, int status,String bikeImage) {
		super();
		this.bikeId = bikeId;

		commonConstructorMethod(tariffId,bikeName, bikeDescription, bikeCategory, bikeCompany, bikeModel, bikeRCNo, bikeRCName,
				bikeRCRegDate, bikeRCExpDate, bikeRCCHNO, bikeRCEnginNo, bikeYearMfg, bikeNoOfGear, bikeColor,
				selfstart, bikeEnginCC, status,bikeImage);
	}

	private void commonConstructorMethod(String tariffId,String bikeName, String bikeDescription, String bikeCategory,
			String bikeCompany, String bikeModel, String bikeRCNo, String bikeRCName, String bikeRCRegDate,
			String bikeRCExpDate, String bikeRCCHNO, String bikeRCEnginNo, String bikeYearMfg, int bikeNoOfGear,
			String bikeColor, int selfstart, int bikeEnginCC, int status,String bikeImage) {

		this.tariffId=tariffId;
		this.bikeName = bikeName;
		this.bikeDescription = bikeDescription;
		this.bikeCategory = bikeCategory;
		this.bikeCompany = bikeCompany;
		this.bikeModel = bikeModel;
		this.bikeRCNo = bikeRCNo;
		this.bikeRCName = bikeRCName;
		this.bikeRCRegDate = bikeRCRegDate;
		this.bikeRCExpDate = bikeRCExpDate;
		this.bikeRCCHNO = bikeRCCHNO;
		this.bikeRCEnginNo = bikeRCEnginNo;
		this.bikeYearMfg = bikeYearMfg;
		this.bikeNoOfGear = bikeNoOfGear;
		this.bikeColor = bikeColor;
		this.selfstart = selfstart;
		this.bikeEnginCC = bikeEnginCC;
		this.status = status;
		this.bikeImage= bikeImage;
	}

	public Bike(String tariffId,String bikeName, String bikeDescription, String bikeCategory, String bikeCompany, String bikeModel,
			String bikeRCNo, String bikeRCName, String bikeRCRegDate, String bikeRCExpDate, String bikeRCCHNO,
			String bikeRCEnginNo, String bikeYearMfg, int bikeNoOfGear, String bikeColor, int selfstart,
			int bikeEnginCC, int status,String bikeImage) {
		super();
		commonConstructorMethod(tariffId,bikeName, bikeDescription, bikeCategory, bikeCompany, bikeModel, bikeRCNo, bikeRCName,
				bikeRCRegDate, bikeRCExpDate, bikeRCCHNO, bikeRCEnginNo, bikeYearMfg, bikeNoOfGear, bikeColor,
				selfstart, bikeEnginCC, status,bikeImage);
	}

	@Override
	public String toString() {
		return "Bike [bikeId=" + bikeId + ", tariffId=" + tariffId + ", bikeName=" + bikeName + ", bikeDescription="
				+ bikeDescription + ", bikeCategory=" + bikeCategory + ", bikeCompany=" + bikeCompany + ", bikeModel="
				+ bikeModel + ", bikeRCNo=" + bikeRCNo + ", bikeRCName=" + bikeRCName + ", bikeRCRegDate="
				+ bikeRCRegDate + ", bikeRCExpDate=" + bikeRCExpDate + ", bikeRCCHNO=" + bikeRCCHNO + ", bikeRCEnginNo="
				+ bikeRCEnginNo + ", bikeYearMfg=" + bikeYearMfg + ", bikeNoOfGear=" + bikeNoOfGear + ", bikeColor="
				+ bikeColor + ", selfstart=" + selfstart + ", bikeEnginCC=" + bikeEnginCC + ", status=" + status
				+ ", bikeImage=" + bikeImage + "]";
	}

	public String getTariffId() {
		return tariffId;
	}

	public void setTariffId(String tariffId) {
		this.tariffId = tariffId;
	}

	public String getBikeImage() {
		return bikeImage;
	}

	public void setBikeImage(String bikeImage) {
		this.bikeImage = bikeImage;
	}

	public String getBikeId() {
		return bikeId;
	}

	public void setBikeId(String bikeId) {
		this.bikeId = bikeId;
	}

	public String getBikeName() {
		return bikeName;
	}

	public void setBikeName(String bikeName) {
		this.bikeName = bikeName;
	}

	public String getBikeDescription() {
		return bikeDescription;
	}

	public void setBikeDescription(String bikeDescription) {
		this.bikeDescription = bikeDescription;
	}

	public String getBikeCategory() {
		return bikeCategory;
	}

	public void setBikeCategory(String bikeCategory) {
		this.bikeCategory = bikeCategory;
	}

	public String getBikeCompany() {
		return bikeCompany;
	}

	public void setBikeCompany(String bikeCompany) {
		this.bikeCompany = bikeCompany;
	}

	public String getBikeModel() {
		return bikeModel;
	}

	public void setBikeModel(String bikeModel) {
		this.bikeModel = bikeModel;
	}

	public String getBikeRCNo() {
		return bikeRCNo;
	}

	public void setBikeRCNo(String bikeRCNo) {
		this.bikeRCNo = bikeRCNo;
	}

	public String getBikeRCName() {
		return bikeRCName;
	}

	public void setBikeRCName(String bikeRCName) {
		this.bikeRCName = bikeRCName;
	}

	public String getBikeRCRegDate() {
		return bikeRCRegDate;
	}

	public void setBikeRCRegDate(String bikeRCRegDate) {
		this.bikeRCRegDate = bikeRCRegDate;
	}

	public String getBikeRCExpDate() {
		return bikeRCExpDate;
	}

	public void setBikeRCExpDate(String bikeRCExpDate) {
		this.bikeRCExpDate = bikeRCExpDate;
	}

	public String getBikeRCCHNO() {
		return bikeRCCHNO;
	}

	public void setBikeRCCHNO(String bikeRCCHNO) {
		this.bikeRCCHNO = bikeRCCHNO;
	}

	public String getBikeRCEnginNo() {
		return bikeRCEnginNo;
	}

	public void setBikeRCEnginNo(String bikeRCEnginNo) {
		this.bikeRCEnginNo = bikeRCEnginNo;
	}

	public String getBikeYearMfg() {
		return bikeYearMfg;
	}

	public void setBikeYearMfg(String bikeYearMfg) {
		this.bikeYearMfg = bikeYearMfg;
	}

	public int getBikeNoOfGear() {
		return bikeNoOfGear;
	}

	public void setBikeNoOfGear(int bikeNoOfGear) {
		this.bikeNoOfGear = bikeNoOfGear;
	}

	public String getBikeColor() {
		return bikeColor;
	}

	public void setBikeColor(String bikeColor) {
		this.bikeColor = bikeColor;
	}

	public int getSelfstart() {
		return selfstart;
	}

	public void setSelfstart(int selfstart) {
		this.selfstart = selfstart;
	}

	public int getBikeEnginCC() {
		return bikeEnginCC;
	}

	public void setBikeEnginCC(int bikeEnginCC) {
		this.bikeEnginCC = bikeEnginCC;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
