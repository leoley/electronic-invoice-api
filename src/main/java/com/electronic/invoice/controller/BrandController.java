package com.electronic.invoice.controller;

import com.electronic.invoice.dto.BrandDto;
import com.electronic.invoice.services.BrandService;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Post;
import reactor.core.publisher.Mono;

import javax.validation.Valid;

@Controller("/brands")
public class BrandController {
    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }

    @Post
    public Mono<HttpResponse<BrandDto>> createBrand(@Body @Valid BrandDto brandDto) {
        return Mono.just(
                brandService.findById(brandDto.getBrandId()).isPresent() ?
                        HttpResponse.badRequest() :
                        HttpResponse.created(brandService.createBrand(brandDto))
        );
    }
}
