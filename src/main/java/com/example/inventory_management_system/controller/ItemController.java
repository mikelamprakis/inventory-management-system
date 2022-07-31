package com.example.inventory_management_system.controller;
import java.math.BigDecimal;
import java.util.EnumSet;
import java.util.Optional;
import com.example.inventory_management_system.model.Basket;
import com.example.inventory_management_system.model.User;
import com.example.inventory_management_system.model.enums.Category;
import com.example.inventory_management_system.repository.BasketDao;
import com.example.inventory_management_system.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.inventory_management_system.model.Item;
import com.example.inventory_management_system.repository.SupplierDao;
import com.example.inventory_management_system.repository.ItemDao;
import javax.servlet.http.HttpSession;

@Controller
public class ItemController {

	@Autowired
	private ItemDao itemDao;

	@Autowired
	private SupplierDao supplierDao;

	@Autowired
	private BasketDao basketDao;

	@Autowired
	private UserDao userDao;

	public static final String BASKET_ID = "BASKET_ID";
	public static final String ITEMS = "ITEMS";

	// Changed from @GetMapping to @RequestMapping to handle both post & get 
	@RequestMapping("AllItems")
	public ModelAndView allBooks() {
		return new ModelAndView("PAGES/item/allItems.jsp", "items", itemDao.findAll());
	}	

	@GetMapping("AddItem")
	public ModelAndView addItem() {
		ModelAndView mv = new ModelAndView("PAGES/item/addItem.jsp");
		mv.addObject("allSuppliers", supplierDao.findAll());
		mv.addObject("categories", EnumSet.allOf(Category.class));
		mv.addObject("item", new Item());
		return mv;
	}
	
	@PostMapping("EditOrAddItemSubmit")
    public ModelAndView addItemSubmit(
    		@ModelAttribute("item") Item item) {
		itemDao.save(item);
        return new ModelAndView("PAGES/item/allItems.jsp", "items", itemDao.findAll());
    }
	
	@GetMapping("EditItem")
	public ModelAndView editItem(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Optional<Item> itemFromDB = itemDao.findById(id);
		if (!itemFromDB.isPresent()) {
			mv.addObject("errorMessage", "The selected item is no longer available");
			mv.addObject("item", itemDao.findAll());
			mv.setViewName("PAGES/item/allItems.jsp");
		} else {
			mv.addObject("item", itemFromDB.get());
			mv.addObject("allSuppliers", supplierDao.findAll());
			mv.addObject("categories", EnumSet.allOf(Category.class));
			mv.setViewName("PAGES/item/editItem.jsp");
		}
		return mv;
	}

	@GetMapping("open-order")
	public ModelAndView showAllItems(HttpSession session) {
		Basket currentBasket = new Basket();
		basketDao.save(currentBasket);
		session.setAttribute(BASKET_ID, currentBasket.getId());
		return new ModelAndView("PAGES/basket/orderPage.jsp", "items", itemDao.findAll());
	}

	@GetMapping("addQuantity")
	public ModelAndView addToBasket(@RequestParam("id")int id) {
		Item itemFromDB = itemDao.findById(id).get();
		ModelAndView mv = new ModelAndView();
		mv.addObject("item",itemFromDB);
		mv.addObject("id", id);
		mv.setViewName("PAGES/item/quantityForm.jsp");
		return mv;
	}

	@PostMapping("submit-quantity")
	public ModelAndView submitQuantity(
			@RequestParam("id")int id,
			@RequestParam("requestedQuantity")int requestedQuantity,
			HttpSession session
	) {
		ModelAndView mv = new ModelAndView();

		int basketId = (int) session.getAttribute(BASKET_ID);
		Basket currentBasket= basketDao.findById(basketId).get();

		int userId = (int) session.getAttribute(LoginController.USER_ID);
		User currentUser = userDao.findById(userId).get();

		Item itemFromDB = itemDao.findById(id).get();
		if (itemFromDB.getStock() > requestedQuantity) {
			for (int i=0; i<requestedQuantity; i++) {
				currentBasket.getListOfItems().add(itemFromDB);
			}

			itemFromDB.setStock(itemFromDB.getStock()-requestedQuantity);
			itemDao.save(itemFromDB);

			currentBasket.setUser(currentUser);
			currentBasket.setAmount(currentBasket.getAmount().add(itemFromDB.getPrice().multiply(BigDecimal.valueOf(requestedQuantity))));
			basketDao.save(currentBasket);

			mv.addObject("items", itemDao.findAll());
			mv.setViewName("PAGES/basket/orderPage.jsp");
			mv.addObject("message", "Items Added Successfully");
		}else {
			mv.addObject("id", id);
			mv.setViewName("PAGES/item/quantityForm.jsp");
			mv.addObject("message", "Not enough Stock");
		}
		return mv;
	}

}
