import 'tranports/i_transport.dart';
import 'tranports/o_trasports.dart';

enum TiposEntrega { mar, terra, ar }

void main() {
  Transport pedido = RoadLogistics().planDeluvery(TiposEntrega.mar);
  pedido.entregar();
}

abstract class Logistics {
  TiposEntrega? tiposEntrega;

  planDeluvery(TiposEntrega tiposEntrega) {
    if (tiposEntrega == TiposEntrega.terra) {
      return RoadLogistics().createTransport();
    } else if (tiposEntrega == TiposEntrega.mar) {
      return SeaLogistvs().createTransport();
    } else {
      return ViasAerias().createTransport();
    }
  }

  Transport createTransport();
}

class RoadLogistics extends Logistics {
  @override
  Transport createTransport() {
    return Camiao();
  }
}

class SeaLogistvs extends Logistics {
  @override
  createTransport() {
    return Barco();
  }
}

class ViasAerias extends Logistics {
  @override
  createTransport() {
    return Aviao();
  }
}
