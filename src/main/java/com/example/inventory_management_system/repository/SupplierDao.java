package com.example.inventory_management_system.repository;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.inventory_management_system.model.Supplier;

@Repository
public interface SupplierDao extends JpaRepository<Supplier, Integer> {
	
	public List<Supplier> findByName(@Param("name")String lastName);
	
	public List<Supplier> findByNameAndDetails(
			@Param("name")String name,
			@Param("details")String details);

	@Query("select a from Supplier a order by a.name")
	public List<Supplier> findAllOrderedByLastname();

}
