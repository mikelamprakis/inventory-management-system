package com.example.inventory_management_system.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.inventory_management_system.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {

    public User findByUsernameAndPassword(
            @Param("username")String username,
            @Param("password")String password);

	public User findByUsername(@Param("username")String username);

}
