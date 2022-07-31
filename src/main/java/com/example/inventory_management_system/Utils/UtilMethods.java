package com.example.inventory_management_system.Utils;

import com.example.inventory_management_system.model.Basket;
import com.example.inventory_management_system.model.User;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class UtilMethods {

    private UtilMethods(){
    }

    public static List<Basket> loadBasketsByUser(List<Basket> allBaskets, User currentUser){
        List<Basket> basketsFromUser = new ArrayList<>();
        for (Basket basket : allBaskets){
            if (!basket.getStatus().getName().equals("OPEN")){
                Optional<Integer> userId = Optional.of(basket.getUser().getId());
                if (userId.isPresent() && userId.get() !=null){
                    if (basket.getUser().getId() == currentUser.getId()){
                        basketsFromUser.add(basket);
                    }
                }
            }
        }
        return basketsFromUser;
    }

    public static List<Basket> loadAllBaskets(List<Basket> allBaskets){
        List<Basket> baskets = allBaskets
                .stream().filter(value-> !value.getStatus().getName().equals("OPEN")).collect(Collectors.toList());
        return baskets;
    }
}
