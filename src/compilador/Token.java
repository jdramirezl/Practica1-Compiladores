package compilador;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nelson Jaramillo
 */
public class Token {
    public String id;
    public String contenido;

    @Override
    public String toString() {
        return "\n" + id + "  " + contenido  ;
    }

    public Token(String id, String contenido) {
        this.id = id;
        this.contenido = contenido;
    }

    
}
