package com.electronic.invoice;

import io.micronaut.runtime.Micronaut;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.info.*;

@OpenAPIDefinition(
    info = @Info(
            title = "electronic-invoice-api",
            version = "0.0"
    )
)
public class RunApplicationApi {

    public static void main(String[] args) {
        Micronaut.run(RunApplicationApi.class, args);
    }
}