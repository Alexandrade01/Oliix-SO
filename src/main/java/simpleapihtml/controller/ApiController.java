package simpleapihtml.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/mensagem")
    public String obterMensagem() {
        return "Olá, esta é a mensagem da API!  -- Oliix EC8";
    }
}
