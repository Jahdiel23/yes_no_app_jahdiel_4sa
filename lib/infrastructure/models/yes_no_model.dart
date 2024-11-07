//el modelo define los datos que debe
//tener la aplicacion
//vista:pantalla, controlador:logica
//MVC: modelo=informacion
//vista: lo que vemos

class YesNoModels {
  //Atributos de la clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModels(
      {required this.answer, required this.forced, required this.image});
}