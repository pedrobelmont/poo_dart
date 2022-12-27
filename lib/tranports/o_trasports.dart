import 'i_transport.dart';

class Barco implements Transport {
  @override
  void entregar() {
    print('intregando pelo o mar');
  }
}

class Camiao implements Transport {
  @override
  void entregar() {
    print('entrgando pela terra');
  }
}

class Aviao implements Transport {
  @override
  void entregar() {
    print('entregando via aerias');
  }
}
