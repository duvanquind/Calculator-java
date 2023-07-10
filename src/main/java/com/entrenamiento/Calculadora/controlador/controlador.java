package com.entrenamiento.Calculadora.controlador;
import com.entrenamiento.Calculadora.modelo.resultado;

import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RestController
@RequestMapping("/version")
public class VersionController {
    @GetMapping(produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> version(){
        return new ResponseEntity<>("app-name v#{Build.BuildNumber}#", HttpStatus.OK);
    }
}

@CrossOrigin(origins = "*")
@RestController

public class controlador {
    @RequestMapping(value = "/cal/suma", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public resultado suma(@RequestParam(name = "op1", required = false, defaultValue = "0") String op1,
                          @RequestParam(name = "op2", required = false, defaultValue = "0") String op2) {

        resultado exported = new resultado();

        try {

            float castop1 = Float.parseFloat(op1);
            float castop2 = Float.parseFloat(op2);

            float resultado_int = castop1 + castop2;

            exported.setResultado(resultado_int);
            exported.setEstado("ok");
        } catch (NumberFormatException Ex) {
            exported.setEstado("Error en un de los datos enviados ");

        }
        return exported;
    }

    @RequestMapping(value = "/cal/resta", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public resultado resta(@RequestParam(name = "op1", required = false, defaultValue = "0") String op1,
                           @RequestParam(name = "op2", required = false, defaultValue = "0") String op2) {

        resultado exported = new resultado();

        try {

            float castop1 = Float.parseFloat(op1);
            float castop2 = Float.parseFloat(op2);

            float resultado_int = castop1 - castop2;

            exported.setResultado(resultado_int);
            exported.setEstado("ok");
        } catch (NumberFormatException ex) {
            exported.setEstado("Error en un de los datos enviados ");

        }
        return exported;
    }

    @RequestMapping(value = "/cal/multiplicar", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public resultado multiplicar(@RequestParam(name = "op1", required = false, defaultValue = "0") String op1,
                                 @RequestParam(name = "op2", required = false, defaultValue = "0") String op2) {

        resultado exported = new resultado();

        try {

            float castop1 = Float.parseFloat(op1);
            float castop2 = Float.parseFloat(op2);

            float resultado_int = castop1 * castop2;

            exported.setResultado(resultado_int);
            exported.setEstado("ok");
        } catch (NumberFormatException ex) {
            exported.setEstado("Error en un de los datos enviados ");

        }
        return exported;
    }

    @RequestMapping(value = "/cal/dividir", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public resultado dividir(@RequestParam(name = "op1", required = false, defaultValue = "0") String op1,
                             @RequestParam(name = "op2", required = false, defaultValue = "0") String op2) {

        resultado exported = new resultado();
        try {

            float castop1 = Float.parseFloat(op1);
            float castop2 = Float.parseFloat(op2);

            if (castop2 == 0) {
                throw new ArithmeticException();
            }
            float resultado_int = castop1 / castop2;

            exported.setResultado(resultado_int);
            exported.setEstado("ok");
        } catch (NumberFormatException ex) {
            exported.setEstado("Error en un de los datos enviados ");
        } catch (ArithmeticException zeroEx) {
            exported.setEstado("No es posible realizar la operacion");
        }

        return exported;

    }

    /*@RequestMapping(value = "/raiz_cuadrada", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public resultado raiz(@RequestParam(name = "op1", required = false, defaultValue = "0") String op1) {
        resultado export = new resultado();
        try {
            int valor = Integer.parseInt(op1);

            if (valor < 0) {
                throw new ArithmeticException();
            }
            Double resultado_int = Math.sqrt(valor);

            export.setResultado_raiz(resultado_int);
            export.setEstado("full");

        } catch (ArithmeticException negativoEx) {
            export.setEstado("El numero es negativo");
        } catch (NumberFormatException X){
            export.setEstado("Error en un de los datos enviados ");
        }

        return export;
    }*/
}


