import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

class TokenManager {
  static const Duration defaultTokenDuration = Duration(hours: 24);
  final Map<String, Token> _tokens = {};
  final Uuid _uuid = const Uuid();

  Token generateToken({Duration? duration}) {
    final tokenValue = _generateSecureToken();
    final token = Token(
      value: tokenValue,
      expiresAt: DateTime.now().add(duration ?? defaultTokenDuration),
    );

    _tokens[tokenValue] = token;
    return token;
  }

  bool validateToken(String tokenValue) {
    final token = _tokens[tokenValue];
    if (token == null) return false;

    if (token.isExpired) {
      _tokens.remove(tokenValue);
      return false;
    }

    return true;
  }

  Token? getToken(String tokenValue) {
    final token = _tokens[tokenValue];
    if (token == null || token.isExpired) {
      _tokens.remove(tokenValue);
      return null;
    }
    return token;
  }

  void revokeToken(String tokenValue) {
    _tokens.remove(tokenValue);
  }

  void revokeAllTokens() {
    _tokens.clear();
  }

  int cleanExpiredTokens() {
    final expiredKeys = _tokens.entries
        .where((entry) => entry.value.isExpired)
        .map((entry) => entry.key)
        .toList();

    for (final key in expiredKeys) {
      _tokens.remove(key);
    }

    return expiredKeys.length;
  }

  String _generateSecureToken() {
    final uuid = _uuid.v4();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final combined = '$uuid:$timestamp';
    final bytes = utf8.encode(combined);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}

