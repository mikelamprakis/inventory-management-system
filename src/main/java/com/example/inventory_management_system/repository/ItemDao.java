package com.example.inventory_management_system.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.inventory_management_system.model.Item;

@Repository
public interface ItemDao extends JpaRepository<Item, Integer> {

}
