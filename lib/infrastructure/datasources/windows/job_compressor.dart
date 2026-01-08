import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class JobPayload {
  final Uint8List splData;
  final Uint8List? shdData;
  final String splHash;
  final String? shdHash;
  final int originalSize;
  final int compressedSize;
  final bool isCompressed;

  const JobPayload({
    required this.splData,
    this.shdData,
    required this.splHash,
    this.shdHash,
    required this.originalSize,
    required this.compressedSize,
    required this.isCompressed,
  });

  double get compressionRatio =>
      originalSize > 0 ? compressedSize / originalSize : 1.0;

  @override
  String toString() =>
      'JobPayload(original: $originalSize, compressed: $compressedSize, ratio: ${(compressionRatio * 100).toStringAsFixed(1)}%)';
}

class JobCompressor {
  Uint8List compress(Uint8List data) {
    final codec = GZipCodec(level: 6);
    return Uint8List.fromList(codec.encode(data));
  }

  Uint8List decompress(Uint8List compressedData) {
    final codec = GZipCodec();
    return Uint8List.fromList(codec.decode(compressedData));
  }

  String computeHash(Uint8List data) {
    return sha256.convert(data).toString();
  }

  bool verifyHash(Uint8List data, String expectedHash) {
    return computeHash(data) == expectedHash;
  }

  JobPayload createPayload({
    required Uint8List splData,
    Uint8List? shdData,
    bool shouldCompress = true,
  }) {
    final originalSplSize = splData.length;
    final originalShdSize = shdData?.length ?? 0;
    final originalSize = originalSplSize + originalShdSize;

    final Uint8List finalSplData;
    final Uint8List? finalShdData;

    if (shouldCompress) {
      finalSplData = compress(splData);
      finalShdData = shdData != null ? compress(shdData) : null;
    } else {
      finalSplData = splData;
      finalShdData = shdData;
    }

    final compressedSize =
        finalSplData.length + (finalShdData?.length ?? 0);

    return JobPayload(
      splData: finalSplData,
      shdData: finalShdData,
      splHash: computeHash(finalSplData),
      shdHash: finalShdData != null ? computeHash(finalShdData) : null,
      originalSize: originalSize,
      compressedSize: compressedSize,
      isCompressed: shouldCompress,
    );
  }

  ({Uint8List spl, Uint8List? shd}) extractPayload(
    JobPayload payload, {
    bool isCompressed = true,
  }) {
    final Uint8List spl;
    final Uint8List? shd;

    if (isCompressed) {
      spl = decompress(payload.splData);
      shd = payload.shdData != null ? decompress(payload.shdData!) : null;
    } else {
      spl = payload.splData;
      shd = payload.shdData;
    }

    return (spl: spl, shd: shd);
  }
}

class PayloadChunker {
  final int chunkSize;

  const PayloadChunker({this.chunkSize = 65536});

  List<Uint8List> chunk(Uint8List data) {
    final chunks = <Uint8List>[];
    var offset = 0;

    while (offset < data.length) {
      final end = (offset + chunkSize).clamp(0, data.length);
      chunks.add(Uint8List.sublistView(data, offset, end));
      offset = end;
    }

    return chunks;
  }

  Uint8List reassemble(List<Uint8List> chunks) {
    final totalLength = chunks.fold<int>(0, (sum, chunk) => sum + chunk.length);
    final result = Uint8List(totalLength);

    var offset = 0;
    for (final chunk in chunks) {
      result.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }

    return result;
  }

  int calculateChunkCount(int totalSize) {
    return (totalSize / chunkSize).ceil();
  }
}

