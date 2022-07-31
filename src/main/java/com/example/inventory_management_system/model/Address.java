package com.example.inventory_management_system.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "address_gen")
	@SequenceGenerator(name = "address_gen", sequenceName = "ADDRESS_SEQ", allocationSize = 1)
	private int id;

	@Column
	private String warehouse;
	
	@Column(length = 50)
	private String houseNumber;
	
	@Column(length = 100)
	private String street;

	@Column(length = 50)
	private String city;
	
	@Column(length = 10)
	private String postcode;
	
	public Address() {
		super();
	}

	public Address(String houseNumber, String street, String city, String postcode) {
		super();  
		this.houseNumber = houseNumber;
		this.street = street;
		this.city= city;
		this.postcode = postcode;
	}

	public String getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", houseNumber=" + houseNumber + ", street=" + street + ", city=" + city
				+ ", postcode=" + postcode + "]";
	}
}
