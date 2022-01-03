class Data{
    Map<String, double> vars;
    List ordenes = [];

    Data(): vars = {
      'a': 5,
      'b': 10,
      'x': 0
    };

    void currentState(){
      print("Values: $vars");
    }

    dynamic operate(String order) {
      List<String> sintaxis = order.toString().split('=');
      String resultado = sintaxis[0].trim();
      String operacion = "", numero1 = "", numero2 = "";
      List<String> cuerpo = [];
      if (sintaxis[1].contains("+")) {
        operacion = "+";
        cuerpo = sintaxis[1].split("+");
      }
      else if (sintaxis[1].contains("-")) {
        operacion = "-";
        cuerpo = sintaxis[1].split("-");
      }
      else if (sintaxis[1].contains("*")) {
        operacion = "*";
        cuerpo = sintaxis[1].split("*");
      }
      else if (sintaxis[1].contains("/")) {
        operacion = "/";
        cuerpo = sintaxis[1].split("/");
      }
      numero1 = cuerpo[0].trim();
      numero2 = cuerpo[1].trim();
      print('Se guarda en: $resultado');
      print('Operacion: $operacion');
      print('Numero 1: $numero1');
      print('Numero 2: $numero2');
      print("");

      double res = -1;
      try {
        switch (operacion) {
          case "+":
            res = vars[numero1] + vars[numero2];
            break;
          case "-":
            res = vars[numero1] - vars[numero2];
            break;
          case "*":
            res = vars[numero1] * vars[numero2];
            break;
          case "/":
            res = vars[numero1] / vars[numero2];
            break;
        }
      }
      catch(ex){
        return 'error';
      }

      if (vars.containsKey(resultado)) {
        vars[resultado] = res;
      }
      else {
        vars.addAll({resultado: res});
      }
      print("Valores finales: $vars");
      return 'done';
    }
}