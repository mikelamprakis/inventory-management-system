package com.example.inventory_management_system.controller;
import com.example.inventory_management_system.model.Supplier;
import com.example.inventory_management_system.repository.SupplierDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDao supplierDao;
	
	@GetMapping("AllSuppliers")
	public ModelAndView allAuthors() {
		return new ModelAndView("PAGES/supplier/allSuppliers.jsp", "suppliers", supplierDao.findAll());
	}

	//TODO: Add jsp page and logic to edit supplier
	@GetMapping("EditSupplier")
	public ModelAndView editSupplier(@RequestParam("id") int id) {
		return new ModelAndView("PAGES/editSupplier.jsp", "supplier", supplierDao.findById(id));
	}

	@PostMapping(value="EditSupplierSubmit")
	public ModelAndView editSupplierSubmit(
            @ModelAttribute("supplier") Supplier supplier, ModelMap model) {

		supplierDao.save(supplier);
		return new ModelAndView("forward:AllSuppliers", model);
	}
}
