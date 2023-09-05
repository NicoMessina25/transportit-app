package com.funmesseg.transportit.dao.customer;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    
    
    
}
