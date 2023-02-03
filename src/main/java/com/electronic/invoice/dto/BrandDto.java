package com.electronic.invoice.dto;

import io.micronaut.core.annotation.Introspected;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Introspected
@AllArgsConstructor
@NoArgsConstructor
public class BrandDto implements Serializable {
    @NotBlank(message = "Brand name is required")
    private Long brandId;
    @NotBlank(message = "Brand name is required")
    private String name;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
