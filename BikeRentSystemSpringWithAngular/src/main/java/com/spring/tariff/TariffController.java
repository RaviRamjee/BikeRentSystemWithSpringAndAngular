package com.spring.tariff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.google.appengine.api.datastore.Key;

@Controller
public class TariffController {

	// getting datastore service
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	// getting object of ModelAndView
	ModelAndView mv = new ModelAndView();
	Tariff tariff = new Tariff();
	TariffDao dao = new TariffDao();

	@PostMapping(value = "/addTariff",consumes = "application/json",produces = "application/json")
	public @ResponseBody Tariff addTariff(@RequestBody Tariff tariff) {

        return dao.insert(tariff);
	}
	
	@PutMapping(value = "/updateTariff",consumes = "application/json",produces = "application/json")
	public @ResponseBody Tariff updateTariff(@RequestBody Tariff tariff){

		return dao.update(tariff,tariff.getTariffId()); //updating data in datastore

	}
	
	@GetMapping(value = "/deleteTariff")
	public ModelAndView deleteTariffById(@RequestParam("tariffId") String tariffId){

         dao.deleteTariffById(tariffId);
         mv.setViewName("ShowTariff");
         return mv;
	}

}
