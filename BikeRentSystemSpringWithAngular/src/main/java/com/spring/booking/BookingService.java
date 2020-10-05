package com.spring.booking;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BookingService {
	
	public String dateFormatter()
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String bookingTime = dtf.format(now);
		
		return bookingTime;
	}
}
