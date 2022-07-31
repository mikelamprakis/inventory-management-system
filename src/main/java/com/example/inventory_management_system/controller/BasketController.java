package com.example.inventory_management_system.controller;

import com.example.inventory_management_system.Utils.UtilMethods;
import com.example.inventory_management_system.constants.Constants;
import com.example.inventory_management_system.repository.BasketDao;
import com.example.inventory_management_system.repository.ItemDao;
import com.example.inventory_management_system.repository.UserDao;
import com.example.inventory_management_system.model.Basket;
import com.example.inventory_management_system.model.Item;
import com.example.inventory_management_system.model.ItemOrder;
import com.example.inventory_management_system.model.User;
import com.example.inventory_management_system.model.enums.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BasketController {
	
	@Autowired
	private BasketDao basketDao;

	@Autowired
	private ItemDao itemDao;

	@Autowired
	private UserDao userDao;
	
	
	@GetMapping("checkout")
	public ModelAndView gotoCart(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();

		int basketId = (int) session.getAttribute(ItemController.BASKET_ID);
		Basket currentBasket = basketDao.findById(basketId).get();

		List<ItemOrder> fullOrder = new ArrayList<>();
		for (Item i : currentBasket.getListOfItems()){
			int quantity = 0 ;
			BigDecimal cost = BigDecimal.valueOf(0) ;
			for (Item j : currentBasket.getListOfItems()){
				if (i.getId() == j.getId()) {
					quantity++;
					cost = cost.add(j.getPrice());
				}
			}

			boolean isAddedInOrder = false;
			for (ItemOrder itemOrder : fullOrder){
				if (itemOrder.getItemId() == i.getId()){
					isAddedInOrder = true;
				}
			}
			if (!isAddedInOrder){
				fullOrder.add(new ItemOrder(i.getId(), i.getTitle(), quantity , cost));
			}

		}

		mv.addObject("fullOrder", fullOrder);
		mv.addObject("amount", currentBasket.getAmount());
		mv.setViewName("PAGES/basket/checkoutPage.jsp");
		return mv;
	}

	@GetMapping ("CancelOrder")
	public ModelAndView cancelOrder(HttpSession session){
		ModelAndView mv = new ModelAndView();

		int basketId = (int) session.getAttribute(ItemController.BASKET_ID);
		Basket currentBasket = basketDao.findById(basketId).get();

		for (Item item : currentBasket.getListOfItems()){
			Item itemFromDB = itemDao.findById(item.getId()).get();
			itemFromDB.setStock(itemFromDB.getStock() + 1);
		}
		basketDao.delete(currentBasket);

		Basket newBasket = new Basket();
		basketDao.save(newBasket);
		session.setAttribute(ItemController.BASKET_ID, newBasket.getId());
		mv.addObject("items", itemDao.findAll());
		mv.setViewName("PAGES/basket/orderPage.jsp");
		return mv;
	}


	@GetMapping("SubmitOrder")
	public ModelAndView submitOrder(HttpSession session){
		ModelAndView mv = new ModelAndView();

		int basketId = (int) session.getAttribute(ItemController.BASKET_ID);
		Basket currentBasket = basketDao.findById(basketId).get();

		currentBasket.setStatus(OrderStatus.SUBMITTED);
		basketDao.save(currentBasket);

		Basket newBasket = new Basket();
		basketDao.save(newBasket);
		session.setAttribute(ItemController.BASKET_ID, newBasket.getId());
		mv.addObject("items", itemDao.findAll());
		mv.setViewName("PAGES/basket/orderPage.jsp");
		return mv;
	}

	@RequestMapping("AllBaskets")
	public ModelAndView allBaskets() {
		List<Basket> baskets = UtilMethods.loadAllBaskets(basketDao.findAll());
		return new ModelAndView("PAGES/basket/allBaskets.jsp", Constants.BASKETS, baskets);
	}

	@RequestMapping("basketsByClient")
	public ModelAndView allBasketsFromUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		int userId = (int) session.getAttribute(LoginController.USER_ID);
		User currentUser = userDao.findById(userId).get();

		List<Basket> basketsFromUser = UtilMethods.loadBasketsByUser(basketDao.findAll(), currentUser);

		mv.addObject(Constants.BASKETS, basketsFromUser);
		mv.setViewName("PAGES/basket/allBasketsByClient.jsp");
		return mv;
	}

	@RequestMapping("deleteBasket")
	public ModelAndView deleteBasket(
			@RequestParam("id") int basketId,
			HttpSession session
	) {
		ModelAndView mv = new ModelAndView();

		Basket basketFromDB = basketDao.findById(basketId).get();
		for (Item item :basketFromDB.getListOfItems()){
			item.setStock(item.getStock() + 1);
			itemDao.save(item);
		}
		basketDao.delete(basketFromDB);

		int userId = (int) session.getAttribute(LoginController.USER_ID);
		User currentUser = userDao.findById(userId).get();

		List<Basket> basketsByUser = UtilMethods.loadBasketsByUser(basketDao.findAll(), currentUser);

		mv.addObject(Constants.BASKETS, basketsByUser);
		mv.setViewName("PAGES/basket/allBasketsByClient.jsp");
		return mv;
	}


	@RequestMapping("dispatchBasket")
	public ModelAndView dispatchBasket(
			@RequestParam("id") int basketId,
			HttpSession session
	){
		ModelAndView mv = new ModelAndView();

		Basket basketFromDB = basketDao.findById(basketId).get();
		if (basketFromDB.getStatus().getName().equals("DISPATCHED")){
			mv.addObject("message", "This order has already been dispatched") ;
		}else{
			basketFromDB.setStatus(OrderStatus.DISPATCHED);
			basketDao.save(basketFromDB);
		}

		List<Basket> baskets = UtilMethods.loadAllBaskets(basketDao.findAll());
		mv.addObject(Constants.BASKETS, baskets);
		mv.setViewName("PAGES/basket/allBaskets.jsp");
		return mv;
	}









}
