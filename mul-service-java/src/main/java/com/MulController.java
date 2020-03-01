package com;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MulController {

    final static Logger logger = Logger.getLogger(MulController.class);

    @GetMapping("/service/mul")
    public ResponseEntity<String> mul(@RequestParam String va,@RequestParam String vb) {
        Double result = Double.parseDouble(va) * Double.parseDouble(vb);
        logger.info("MUL: " + va + " * " + vb + " == " + result);
        return ResponseEntity.ok(result+"");
    }
}