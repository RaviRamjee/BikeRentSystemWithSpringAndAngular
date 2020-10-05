package com.spring.tariffDetails;

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
import com.spring.tariff.Tariff;
import com.spring.tariff.TariffDao;

@Controller
public class TariffDetailsController {

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	// getting object of ModelAndView
	ModelAndView mv = new ModelAndView();
	TariffDetails tariffDetails = new TariffDetails();
	TariffDetailsDao dao = new TariffDetailsDao();

	@PostMapping(value = "/addTariffDetails",consumes = "application/json",produces = "application/json")
	public @ResponseBody TariffDetails addTariffDetails(@RequestBody TariffDetails tariffDetails) {

		return dao.insert(tariffDetails); // inserting data in datastore
	}
	
	@PutMapping(value = "/updateTariffDetails",consumes = "application/json",produces = "application/json")
	public @ResponseBody TariffDetails updateTariffDetails(@RequestBody TariffDetails tariffDetails){

		return dao.update(tariffDetails,tariffDetails.tariffDetailsId); // update data in datastore
	}
	
	@GetMapping(value = "/deleteTariffDetails")
	public ModelAndView deleteTariffDetails(@RequestParam("tariffDetailsId") String tariffDetailsId) {

		dao.deleteTariffDetailsById(tariffDetailsId);

		mv.setViewName("ShowTariffDetails");

		return mv;

	}

}
