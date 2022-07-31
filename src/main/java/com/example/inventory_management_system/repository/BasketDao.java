package com.example.inventory_management_system.repository;

import com.example.inventory_management_system.model.Basket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BasketDao extends JpaRepository<Basket, Integer>{

}
