package com.example.MyNames

import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table
import org.springframework.data.jpa.repository.JpaRepository

@Entity
@Table(name="names")
data class Names (
  @Id
  val name: String
)

interface Repository: JpaRepository<Names, String> {
}