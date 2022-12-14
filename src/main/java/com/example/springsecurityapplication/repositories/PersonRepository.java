package com.example.springsecurityapplication.repositories;

import com.example.springsecurityapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PersonRepository extends JpaRepository<Person, Integer> {
    // Получаем запись из БД по логину
    Optional<Person> findByLogin(String login);

    // Запрос на получение пользователей по email адресу
    Optional<Person> findByEmail(String email);
    // select * from user_site where email=""


    // Запрос на получение пользователей по номеру телефона
    Optional<Person> findByPhoneNumber(String phone_number);

    //Запрос на получение пользователей по фамилии и сортировка по возрасту
    Optional<Person> findByLastnameOrderByBirthday(String lastname);


    // Запрос на получение пользователей по фамилии, где первые буквы начинаются с определенной последовательности
    Optional<Person> findByLastnameStartingWith(String starting_with);
}
