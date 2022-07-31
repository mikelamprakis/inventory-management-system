package com.example.inventory_management_system.model;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.*;
import com.example.inventory_management_system.Utils.FormatWithLocale;
import com.example.inventory_management_system.model.enums.Category;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "item_gen")
	@SequenceGenerator(name = "item_gen", sequenceName = "ITEM_SEQ", allocationSize = 1)
	private int id;
	
	@Column( length = 150) 
	private String title;
	
	@Column(length = 16)
	private String productCode;

	@Column
	private int stock;

	@Column
	private BigDecimal price;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dateUpdated;

	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE})  // Eager restricted to 2 per class
	private List<Supplier> suppliers;

	@ElementCollection
	private List<Category> categories;

	@Transient
	private int requestedQuantity;

	public Item() {}

	public String getUpdateDateFormatted() {
		return this.getDateUpdated().format(FormatWithLocale.DATE_FORMATTER);
	}

	public String getPriceFormatted() {
		return FormatWithLocale.CURRENCY_FORMATTER.format(this.getPrice());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getproductCode() {
		return productCode;
	}

	public void setproductCode(String producCode) {
		this.productCode = producCode;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public LocalDate getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(LocalDate dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public int getRequestedQuantity() {
		return requestedQuantity;
	}

	public void setRequestedQuantity(int requestedQuantity) {
		this.requestedQuantity = requestedQuantity;
	}


	@Override
	public String toString() {
		return "Item{" +
				"id=" + id +
				", title='" + title + '\'' +
				", productCode='" + productCode + '\'' +
				", stock=" + stock +
				", price=" + price +
				", dateUpdated=" + dateUpdated +
				", suppliers=" + suppliers +
				", categories=" + categories +
				", requestedQuantity=" + requestedQuantity +
				//", totalRequestedQuantity=" + totalRequestedQuantity +
				'}';
	}
}
