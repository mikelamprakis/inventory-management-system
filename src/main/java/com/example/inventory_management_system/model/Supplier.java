package com.example.inventory_management_system.model;
import com.example.inventory_management_system.model.enums.Category;
import javax.persistence.*;
import java.util.List;

@Entity
public class Supplier {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "supplier_gen")
	@SequenceGenerator(name = "supplier_gen", sequenceName = "SUPPLIER_SEQ", allocationSize = 1)
	private int id;

	private String name;
	private String description;
	private Category categories;
	private String details;

	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE})  // Eager restricted to 2 per class
	private List<Address> warehouses;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public List<Address> getWarehouses() {
		return warehouses;
	}

	public void setWarehouses(List<Address> warehouses) {
		this.warehouses = warehouses;
	}

	@Override
	public String toString() {
		return "Supplier{" +
				"id=" + id +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", categories=" + categories +
				", details='" + details + '\'' +
				", warehouses=" + warehouses +
				'}';
	}
}
