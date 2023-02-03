package com.electronic.invoice.mapper;

import com.electronic.invoice.domain.Brand;
import com.electronic.invoice.dto.BrandDto;
import jakarta.inject.Singleton;

@Singleton
public class BrandMapper {
    public BrandDto toDto(Brand brand) {
        BrandDto brandDto = new BrandDto();
        brandDto.setBrandId(brand.getBrandId());
        brandDto.setName(brand.getName());
        return brandDto;
    }

    public Brand toEntity(BrandDto brandDto) {
        Brand brand = new Brand();
        brand.setBrandId(brandDto.getBrandId());
        brand.setName(brandDto.getName());
        return brand;
    }
}
