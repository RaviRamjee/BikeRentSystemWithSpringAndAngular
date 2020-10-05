package com.spring.booking;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.user.UserDao;

@Controller
public class BookingController {

	Booking booking = new Booking();
	BookingDao dao = new BookingDao();
	UserDao userDao=new UserDao();
	BookingService service=new BookingService();
	ModelAndView mv = new ModelAndView();
	
	@PostMapping(value = "/userBooking")
	public ModelAndView booking(@RequestParam("bookingBikeId") String bookingBikeId,
			@RequestParam("bookingName") String bookingName, @RequestParam("bookingBranch") String bookingBranch,
			@RequestParam("bookingDLNo") String bookingDLNo,
			@RequestParam("bookingPickupDate") String bookingPickupDate,
			@RequestParam("bookingPickupTime") String bookingPickupTime,
			@RequestParam("bookingDropDate") String bookingDropDate,
			@RequestParam("bookingDropTime") String bookingDropTime,
			@RequestParam("bookingTariffSelected") String bookingTariffSelected, HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session=request.getSession();  //getting session object
		String userEmail = (String) session.getAttribute("userEmail");
		String userId=userDao.getUserIdByEmail(userEmail);
		String bookingStatus = "booked";

		String bookingTime = service.dateFormatter();

		booking = new Booking(userId, bookingBikeId, bookingName, bookingBranch, bookingDLNo, bookingPickupDate,
				bookingPickupTime, bookingDropDate, bookingDropTime, bookingStatus, bookingTariffSelected, bookingTime);
	
		booking=dao.insert(booking);
		mv.setViewName("BookingMessage");
		mv.addObject("bookingId", booking.getBookingId());
		
	    return mv;
	}

	
	@GetMapping(value = "/cancelBooking")
	public ModelAndView deleteBike(@RequestParam("bookingId") String bookingId) {

		// calling method for delete bike by bike id
		dao.deleteBookingByBookingId(bookingId);

		mv.setViewName("UserBookingDetails");
		return mv;
	}
	

	@PostMapping(value = "/book-queue")
	public void booking() {
		
	}

}
