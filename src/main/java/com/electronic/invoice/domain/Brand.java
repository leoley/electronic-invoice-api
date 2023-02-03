package com.electronic.invoice.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Table(name = "marca", schema = "invoiceDB")
@Entity
@Setter
@Getter
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idMarca")
    private Long brandId;

    @Column(name = "nombre")
    private String name;
}
