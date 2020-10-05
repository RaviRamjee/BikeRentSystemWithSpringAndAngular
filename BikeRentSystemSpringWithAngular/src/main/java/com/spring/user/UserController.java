package com.spring.user;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.spring.utils.EmailUtil;
import com.spring.utils.PasswordUtil;

@Controller
public class UserController {
	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	// getting object of ModelAndView
	ModelAndView mv = new ModelAndView();
	User user = new User();
	UserDao uImpl = new UserDao();
	UserService service = new UserService(); // getting userservice object

	@PostMapping(value = "/regUser")
	protected ModelAndView regUser(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("phoneNo") String phoneNo,
			@RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response) {
		
		service.addTaskQueue(email); //calling addTaskQueue method for add task queue for registration 

		boolean validation = EmailUtil.isValid(email);
		if (validation == true) {
			user = new User(name, email, password, phoneNo, address); // setting user data by constructor

			int temp = 0;
			temp = service.regCheck(email); // calling regCheck method for email checking with datastore property
			/**
			 * -->if temp value is '1' means email is already available in the datastore
			 * -->if temp not equal to '1' then will insert the user data in the datastore
			 */
			if (temp == 1) {
				mv.setViewName("Reg"); // setting view name
			} else {
				uImpl.insert(user);
				mv.setViewName("Login"); // setting view name
				EmailUtil.regMail(user,email);
			}
		} else {
			// redirecting to registration page when validation is false
			mv.setViewName("Reg");
		}

		return mv; // return final view result
	}

	@PostMapping(value = "/loginUser")
	protected ModelAndView loginUser(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String myHash = "";
		myHash = PasswordUtil.passwordHashing(password); // converting password string into cryptography string for
														// comparison

		// comparing email and password for admin and redirect to the admin home page
		if (email.equals("ravirajgzp@gmail.com") && password.equals("Ravi1234@")) {
			// creating session object and set attribute
			HttpSession session = request.getSession();
			session.setAttribute("adminEmail", email);
			response.sendRedirect("AdminHomepage.jsp");
		}
		int temp = 0;
		temp = service.loginCheck(email, myHash);

		if (temp == 1) {
			
			if(email.equals("ravirajgzp@gmail.com")){
				mv.setViewName("Login");
			}else {
			// creating session object and set attribute
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", email);

			mv.setViewName("WelcomeHomepage"); // setting view if email and password is matching
			mv.addObject("email", email);
			}
		} else {
			mv.setViewName("Login"); // sending to login page again if email and password not matches
		}

		return mv;
	}
	
	@PostMapping(value = "/reg-queue")
	protected void regQueue(@RequestParam("email") String email) {
	
		String callRequest="Got a Signup Subscriber Request for Email ID : "+email; 
		
		System.out.println(callRequest);
	}

}
