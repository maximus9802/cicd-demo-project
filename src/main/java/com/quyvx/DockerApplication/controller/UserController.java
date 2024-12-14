/*
 * UserController.java
 *
 * Copyright (c) 2024 Vangle. All rights reserved.
 * This software is the confidential and proprietary information of Vangle.
 *
 */
package com.quyvx.DockerApplication.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {

  @GetMapping("/v0/healthz")
  public ResponseEntity<String> health() {
    return ResponseEntity.ok("Health check ok! ");
  }
}
