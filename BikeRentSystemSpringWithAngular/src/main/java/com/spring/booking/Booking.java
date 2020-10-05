package com.spring.booking;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.spring.user.UserService;

@Entity
public class Booking implements Serializable{

	@Id
	String bookingId;
	String bookingUserId;
	String bookingBikeId;
	String bookingName;
	String bookingBranch;
	String bookingDLNo;
	String bookingPickupDate;
	String bookingPickupTime;
	String bookingDropDate;
	String bookingDropTime;
	String bookingStatus;
	String bookingTariffSelected;
	String bookingTime;

	public Booking() {
	}

	public Booking(String bookingId, String bookingUserId, String bookingBikeId, String bookingName,
			String bookingBranch, String bookingDLNo, String bookingPickupDate, String bookingPickupTime,
			String bookingDropDate, String bookingDropTime, String bookingStatus, String bookingTariffSelected,
			String bookingTime) {
		super();
		this.bookingId = bookingId;

		commonConstructorMethod(bookingUserId, bookingBikeId, bookingName, bookingBranch, bookingDLNo,
				bookingPickupDate, bookingPickupTime, bookingDropDate, bookingDropTime, bookingStatus,
				bookingTariffSelected, bookingTime);
	}

	private void commonConstructorMethod(String bookingUserId, String bookingBikeId, String bookingName,
			String bookingBranch, String bookingDLNo, String bookingPickupDate, String bookingPickupTime,
			String bookingDropDate, String bookingDropTime, String bookingStatus, String bookingTariffSelected,
			String bookingTime) {

		this.bookingUserId = bookingUserId;
		this.bookingBikeId = bookingBikeId;
		this.bookingName = bookingName;
		this.bookingBranch = bookingBranch;
		this.bookingDLNo = bookingDLNo;
		this.bookingPickupDate = bookingPickupDate;
		this.bookingPickupTime = bookingPickupTime;
		this.bookingDropDate = bookingDropDate;
		this.bookingDropTime = bookingDropTime;
		this.bookingStatus = bookingStatus;
		this.bookingTariffSelected = bookingTariffSelected;
		this.bookingTime = bookingTime;
	}

	public Booking(String bookingUserId, String bookingBikeId, String bookingName, String bookingBranch,
			String bookingDLNo, String bookingPickupDate, String bookingPickupTime, String bookingDropDate,
			String bookingDropTime, String bookingStatus, String bookingTariffSelected, String bookingTime) {
		super();
		commonConstructorMethod(bookingUserId, bookingBikeId, bookingName, bookingBranch, bookingDLNo,
				bookingPickupDate, bookingPickupTime, bookingDropDate, bookingDropTime, bookingStatus,
				bookingTariffSelected, bookingTime);

	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", bookingUserId=" + bookingUserId + ", bookingBikeId="
				+ bookingBikeId + ", bookingName=" + bookingName + ", bookingBranch=" + bookingBranch + ", bookingDLNo="
				+ bookingDLNo + ", bookingPickupDate=" + bookingPickupDate + ", bookingPickupTime=" + bookingPickupTime
				+ ", bookingDropDate=" + bookingDropDate + ", bookingDropTime=" + bookingDropTime + ", bookingStatus="
				+ bookingStatus + ", bookingTariffSelected=" + bookingTariffSelected + ", bookingTime=" + bookingTime
				+ "]";
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public String getBookingUserId() {
		return bookingUserId;
	}

	public void setBookingUserId(String bookingUserId) {
		this.bookingUserId = bookingUserId;
	}

	public String getBookingBikeId() {
		return bookingBikeId;
	}

	public void setBookingBikeId(String bookingBikeId) {
		this.bookingBikeId = bookingBikeId;
	}

	public String getBookingName() {
		return bookingName;
	}

	public void setBookingName(String bookingName) {
		this.bookingName = bookingName;
	}

	public String getBookingBranch() {
		return bookingBranch;
	}

	public void setBookingBranch(String bookingBranch) {
		this.bookingBranch = bookingBranch;
	}

	public String getBookingDLNo() {
		return bookingDLNo;
	}

	public void setBookingDLNo(String bookingDLNo) {
		this.bookingDLNo = bookingDLNo;
	}

	public String getBookingPickupDate() {
		return bookingPickupDate;
	}

	public void setBookingPickupDate(String bookingPickupDate) {
		this.bookingPickupDate = bookingPickupDate;
	}

	public String getBookingPickupTime() {
		return bookingPickupTime;
	}

	public void setBookingPickupTime(String bookingPickupTime) {
		this.bookingPickupTime = bookingPickupTime;
	}

	public String getBookingDropDate() {
		return bookingDropDate;
	}

	public void setBookingDropDate(String bookingDropDate) {
		this.bookingDropDate = bookingDropDate;
	}

	public String getBookingDropTime() {
		return bookingDropTime;
	}

	public void setBookingDropTime(String bookingDropTime) {
		this.bookingDropTime = bookingDropTime;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public String getBookingTariffSelected() {
		return bookingTariffSelected;
	}

	public void setBookingTariffSelected(String bookingTariffSelected) {
		this.bookingTariffSelected = bookingTariffSelected;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

}
