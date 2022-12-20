package com.develop.authentication_api.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.develop.authentication_api.domain.entity.Token;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {
    
}
