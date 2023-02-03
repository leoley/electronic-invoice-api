package com.electronic.invoice.services;

import com.electronic.invoice.domain.Brand;
import com.electronic.invoice.dto.BrandDto;
import com.electronic.invoice.mapper.BrandMapper;
import com.electronic.invoice.repository.BrandRepository;
import jakarta.inject.Singleton;

import java.util.Optional;

@Singleton
public class BrandService {

    private final BrandRepository brandRepository;
    private final BrandMapper brandMapper;

    public BrandService(BrandRepository brandRepository, BrandMapper brandMapper) {
        this.brandRepository = brandRepository;
        this.brandMapper = brandMapper;
    }

    public BrandDto createBrand(BrandDto brandDto) {
        Brand brand = brandRepository.save(brandMapper.toEntity(brandDto));
        return brandMapper.toDto(brand);
    }

    public Optional<BrandDto> findById(Long id) {
     return brandRepository.findById(id).map(brandMapper::toDto);

    }
}
