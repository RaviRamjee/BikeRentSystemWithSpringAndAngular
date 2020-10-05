package com.spring.bike;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;

@Controller("/bike")
public class BikeController {

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	// getting ModelAndView object
	ModelAndView mv = new ModelAndView();

	Bike bike = new Bike(); // getting Bike pojo object
	BikeService service = new BikeService(); // getting BikeService object for service logic
	BikeDao bikeDao = new BikeDao(); // getting BikeImpl object for datastore persistance

	@PostMapping(value = "/addBike",consumes = "application/json",produces = "application/json")
	public @ResponseBody Bike addBike(@RequestBody Bike bike) {

	 return	bikeDao.insert(bike); // calling insert method for insert the bike data in the datastore
	}

	@PutMapping(value = "/updateBike",consumes = "application/json",produces = "application/json")
	public @ResponseBody Bike updateBike(@RequestBody Bike bike) {

		return bikeDao.update(bike,bike.getBikeId()); // calling update method for update the bike data in the datastore

	}

	@GetMapping(value = "/deleteBike")
	public ModelAndView deleteBike(@RequestParam("bikeId") String bikeId) {

		// calling method for delete bike by bike id
		bikeDao.deleteBikeByBikeId(bikeId);

		mv.setViewName("ShowBikes");
		return mv;
	}
}