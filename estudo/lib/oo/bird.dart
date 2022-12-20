// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:estudo/oo/animal.dart';

class Bird implements Animal {

  final double maxHeight;

  Bird(String name, double weight, this.maxHeight);
  
  @override
  void imprimirDados() {
    // TODO: implement imprimirDados
  }
  
  @override
  String get name => throw UnimplementedError();
  
  @override
  double get weight => throw UnimplementedError();
}
