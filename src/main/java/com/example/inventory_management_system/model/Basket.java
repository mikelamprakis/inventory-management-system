package com.example.inventory_management_system.model;
import com.example.inventory_management_system.model.enums.OrderStatus;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
public class Basket {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "basket_gen")
	@SequenceGenerator(name = "basket_gen", sequenceName = "BASKET_SEQ", allocationSize = 1)
	private int id;
	
	@ManyToMany
	private List<Item> listOfItems ;

	private BigDecimal amount = BigDecimal.valueOf(0);

	private OrderStatus status;

	@ManyToOne
	private User user;

	public Basket() {
		this.status=OrderStatus.OPEN;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Item> getListOfItems() {
		return listOfItems;
	}

	public void setListOfItems(List<Item> listOfItems) {
		this.listOfItems = listOfItems;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Basket{" +
				"id=" + id +
				", listOfItems=" + listOfItems +
				", amount=" + amount +
				", status=" + status +
				", user=" + user +
				'}';
	}
}
