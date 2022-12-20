package com.develop.authentication_api.domain.service;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.develop.authentication_api.domain.entity.Account;
import com.develop.authentication_api.domain.entity.Token;
import com.develop.authentication_api.domain.entity.dto.LoginDTO;
import com.develop.authentication_api.domain.repository.TokenRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TokenService {
    
    private final TokenRepository repository;
    private final AccountService accountService;

    public Token login(LoginDTO dto) {
        Account account = accountService.getByLogin(dto);
        Token token = new Token();
        token.setUsername(account.getUsername());
        token.setToken(UUID.randomUUID().toString());
        token.setValid(LocalDateTime.now().plusMinutes(10));
        return repository.save(token);
    }
}
