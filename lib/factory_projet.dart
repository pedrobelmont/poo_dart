import 'tranports/i_transport.dart';
import 'tranports/o_trasports.dart';

enum TiposEntrega { mar, terra, ar }

void main() {
  Pedido(nome: 'echo dot', etregaRapida: true);
}

class Pedido {
  String nome;
  bool etregaRapida;
  Pedido({required this.nome, required this.etregaRapida}) {
    criaPedido();
  }

  void criaPedido() {
    if (etregaRapida) {
      Transport logisticaPedido =
          LogisticFactor().planDeluvery(TiposEntrega.ar);
      print('seu pedido $nome rapido');
      logisticaPedido.entregar();
    } else {
      Transport logisticaPedido =
          LogisticFactor().planDeluvery(TiposEntrega.terra);
      print('seu pedido $nome');
      logisticaPedido.entregar();
    }
  }
}

class LogisticFactor {
  TiposEntrega? tiposEntrega;
  planDeluvery(TiposEntrega tiposEntrega) {
    if (tiposEntrega == TiposEntrega.terra) {
      return RoadLogistics().createTransport();
    } else if (tiposEntrega == TiposEntrega.mar) {
      return SeaLogistvs().createTransport();
    } else if (tiposEntrega == TiposEntrega.ar) {
      return ViasAerias().createTransport();
    } else {
      this.createTransport();
    }
  }

  createTransport() {
    Transport defal = new Transport().entregar() as Transport;
    return defal;
  }
}

class RoadLogistics extends LogisticFactor {
  @override
  Transport createTransport() {
    return Camiao();
  }
}

class SeaLogistvs extends LogisticFactor {
  @override
  createTransport() {
    return Barco();
  }
}

class ViasAerias extends LogisticFactor {
  @override
  createTransport() {
    return Aviao();
  }
}
