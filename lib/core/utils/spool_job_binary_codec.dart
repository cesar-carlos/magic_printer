import 'dart:convert';
import 'dart:typed_data';

class SpoolJobBinaryCodec {
  static const List<int> _magic = [0x4D, 0x50, 0x4A, 0x42]; // MPJB
  static const int _version = 1;

  Uint8List encode({
    required Uint8List spl,
    Uint8List? shd,
    required String datatype,
  }) {
    final datatypeBytes = utf8.encode(datatype);
    final shdLen = shd?.length ?? 0;
    final hasShd = shd != null;

    final headerLen = 4 + 1 + 1 + 2 + 4 + 4 + 2;
    final totalLen = headerLen + datatypeBytes.length + spl.length + shdLen;
    final out = Uint8List(totalLen);
    final bd = ByteData.sublistView(out);

    var o = 0;
    out.setRange(o, o + 4, _magic);
    o += 4;

    bd.setUint8(o, _version);
    o += 1;

    bd.setUint8(o, hasShd ? 1 : 0);
    o += 1;

    bd.setUint16(o, 0, Endian.little);
    o += 2;

    bd.setUint32(o, spl.length, Endian.little);
    o += 4;

    bd.setUint32(o, shdLen, Endian.little);
    o += 4;

    bd.setUint16(o, datatypeBytes.length, Endian.little);
    o += 2;

    out.setRange(o, o + datatypeBytes.length, datatypeBytes);
    o += datatypeBytes.length;

    out.setRange(o, o + spl.length, spl);
    o += spl.length;

    if (hasShd) {
      out.setRange(o, o + shdLen, shd);
    }

    return out;
  }

  ({Uint8List spl, Uint8List? shd, String datatype}) decode(Uint8List payload) {
    if (payload.length < 4 + 1 + 1 + 2 + 4 + 4 + 2) {
      throw const FormatException('Payload muito pequeno');
    }

    var o = 0;
    final magic = payload.sublist(o, o + 4);
    o += 4;

    if (!_equals4(magic, _magic)) {
      throw const FormatException('Magic inválido');
    }

    final bd = ByteData.sublistView(payload);
    final version = bd.getUint8(o);
    o += 1;

    if (version != _version) {
      throw FormatException('Versão não suportada: $version');
    }

    final hasShd = bd.getUint8(o) == 1;
    o += 1;

    o += 2; // reserved

    final splLen = bd.getUint32(o, Endian.little);
    o += 4;

    final shdLen = bd.getUint32(o, Endian.little);
    o += 4;

    final datatypeLen = bd.getUint16(o, Endian.little);
    o += 2;

    if (payload.length < o + datatypeLen + splLen + (hasShd ? shdLen : 0)) {
      throw const FormatException('Payload truncado');
    }

    final datatypeBytes = payload.sublist(o, o + datatypeLen);
    final datatype = utf8.decode(datatypeBytes);
    o += datatypeLen;

    final spl = Uint8List.sublistView(payload, o, o + splLen);
    o += splLen;

    Uint8List? shd;
    if (hasShd) {
      shd = Uint8List.sublistView(payload, o, o + shdLen);
    }

    return (spl: spl, shd: shd, datatype: datatype);
  }

  bool _equals4(List<int> a, List<int> b) {
    if (a.length != 4 || b.length != 4) return false;
    for (var i = 0; i < 4; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
