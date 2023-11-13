import syntaxtree.*;
import visitor.*;
import java.util.*;

public class Main {
   
   public static void main(String[] args) {
      try {
         Node root = new MiniJavaParser(System.in).Goal();
         Pass1 df1 = new Pass1();
         Object value1 = root.accept(df1, null); // Your assignment part is invoked here.
         Map<String, Pass1.classAttr> ct = df1.classTable;
         Pass2 df2 = new Pass2(ct);
         Object value2 = root.accept(df2, null); // Your assignment part is invoked here.
         System.out.println("Program type checked successfully");

      } catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
}
