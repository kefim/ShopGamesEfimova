package com.example.springsecurityapplication.services;

import com.example.springsecurityapplication.enumm.Status;
import com.example.springsecurityapplication.models.Order;
import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class OrderService {
    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

//    Данный метод позволяет получить заказ по id
    public Order getOrderById(int id){
        Optional<Order> optionalOrder = orderRepository.findById(id);
        return optionalOrder.orElse(null);
    }

    // Данный метод позволяет найти заказы по последним 4 символам номера заказа
    public List<Order> getOrderByNumberEndingWith(String ending_with){
        List<Order> optionalOrder = orderRepository.findByNumberEndingWithIgnoreCase(ending_with);
        return optionalOrder;
    }
    @Transactional
    public void getUpdateStatusOrders(Order order){
        orderRepository.save(order);
    }
}

