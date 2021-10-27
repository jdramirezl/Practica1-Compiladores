package compilador;
import java.io.File;
import java.io.FileReader;

public class App {
    public static void main(String[] args) throws Exception {
        try {
            String ruta = "casos.txt";
            String archivo = new File(ruta).getAbsolutePath();
            Lexer lex = new Lexer(new FileReader(archivo));
            parser p = new parser(lex);
            p.parse(); // compilar
            
            if (lex.errlex.length()==0 && p.errsin.length()==0){
                System.out.println("Compilación correcta");
                System.out.println(lex.ts.toString());
            }
            else{
                System.err.println("Compilacion incorrecta");
                System.err.println(lex.errlex);
                System.err.println(p.errsin);
            }
                
        }catch(Exception e){
            System.err.println(e.getMessage());
            
        }
        // TODO code application logic here
    }
}

/*

*/