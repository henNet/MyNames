package com.example.MyNames

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class Controller(val repository: Repository) {
  @GetMapping("/all")
  fun entryPoint(): List<Names>{
    try {
      val names = repository.findAll();
      return names;
    }catch (e: Exception) {
      return listOf(Names("Deu Erro!"));
    }
  }
}

