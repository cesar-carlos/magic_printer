# 🧪 Testes - Magic Printer

Estrutura de testes do projeto Magic Printer seguindo Clean Architecture.

---

## 📁 Estrutura

```
test/
├── unit/               # Testes unitários (isolados)
│   ├── domain/        # Entities, Use Cases, Value Objects
│   ├── application/   # Services, DTOs, Mappers
│   └── infrastructure # Repositories, Data Sources
├── widget/            # Testes de widgets Flutter
│   ├── pages/        # Pages completas
│   └── widgets/      # Widgets individuais
├── integration/       # Testes de integração
│   ├── grpc/         # Testes gRPC end-to-end
│   └── database/     # Testes de persistência
├── e2e/              # Testes end-to-end completos
└── manual/           # Scripts de teste manual
    └── README.md     # Como executar testes manuais
```

---

## 🚀 Como Executar

### Todos os Testes
```bash
flutter test
```

### Testes Específicos

**Unit Tests**:
```bash
flutter test test/unit/
```

**Widget Tests**:
```bash
flutter test test/widget/
```

**Integration Tests**:
```bash
flutter test test/integration/
```

**End-to-End Tests**:
```bash
flutter test test/e2e/
```

### Com Cobertura

```bash
flutter test --coverage
```

Ver relatório:
```bash
genhtml coverage/lcov.info -o coverage/html
start coverage/html/index.html
```

---

## 📝 Padrões de Teste

### Estrutura AAA (Arrange-Act-Assert)

```dart
test('deve retornar User quando ID é válido', () {
  // Arrange - Preparar
  final repository = MockUserRepository();
  final useCase = GetUserById(repository);
  const userId = 'user-123';
  
  when(() => repository.getById(userId))
      .thenAnswer((_) async => Success(mockUser));
  
  // Act - Executar
  final result = await useCase(userId);
  
  // Assert - Verificar
  expect(result.isSuccess(), true);
  expect(result.getOrNull(), equals(mockUser));
});
```

### Nomenclatura

**Pattern**: `deve_<ação>_quando_<condição>`

**Exemplos**:
- ✅ `deve_retornar_User_quando_ID_valido`
- ✅ `deve_lancar_ValidationFailure_quando_ID_vazio`
- ✅ `deve_atualizar_estado_quando_notified`

---

## 🛠️ Ferramentas

### Pacotes de Teste
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.0        # Mocking
  integration_test:       # Testes E2E
    sdk: flutter
  build_runner: ^2.4.0    # Code generation
```

### Mocking com Mocktail

```dart
import 'package:mocktail/mocktail.dart';

// Criar mock
class MockUserRepository extends Mock implements IUserRepository {}

// Configurar comportamento
when(() => mock.getById(any()))
    .thenAnswer((_) async => Success(user));

// Verificar chamadas
verify(() => mock.getById('123')).called(1);
```

---

## ✅ Checklist de Qualidade

### Para Cada Feature Nova

- [ ] Testes unitários para Domain (entities, use cases)
- [ ] Testes unitários para Application (services)
- [ ] Testes de integração para Infrastructure
- [ ] Testes de widget para Presentation
- [ ] Cobertura mínima de 80%
- [ ] Todos os testes passando
- [ ] Sem testes pulados (skip)

---

## 📊 Métricas de Qualidade

| Métrica | Target | Status |
|---------|--------|--------|
| Cobertura | ≥ 80% | 🔴 0% |
| Testes Unitários | ≥ 200 | 🔴 0 |
| Testes Widget | ≥ 50 | 🔴 0 |
| Testes Integração | ≥ 20 | 🔴 0 |
| Testes E2E | ≥ 5 | 🔴 0 |

> **Nota**: Testes ainda não foram implementados

---

## 🎯 Roadmap de Testes

### Fase 1: Foundation (Próxima)
- [ ] Setup de mocking (mocktail)
- [ ] Primeiros testes de Domain
- [ ] Testes de Use Cases
- [ ] Testes de Value Objects

### Fase 2: Application Layer
- [ ] Testes de Services
- [ ] Testes de DTOs
- [ ] Testes de Mappers

### Fase 3: Infrastructure Layer
- [ ] Testes de Repositories
- [ ] Mocks de gRPC
- [ ] Mocks de FFI
- [ ] Testes de Database

### Fase 4: Presentation Layer
- [ ] Testes de Providers
- [ ] Testes de Widgets
- [ ] Testes de Pages
- [ ] Golden tests

### Fase 5: Integration & E2E
- [ ] Testes gRPC end-to-end
- [ ] Testes de fluxo completo
- [ ] Testes de performance

---

## 📚 Referências

### Documentação
- [Flutter Testing](https://docs.flutter.dev/testing)
- [Mocktail Package](https://pub.dev/packages/mocktail)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

### Interno
- `.cursor/rules/testing.mdc` - Padrões de teste do projeto
- `docs/README.md` - Índice da documentação
- `test/manual/` - Testes manuais gRPC

---

## 🤝 Contribuindo com Testes

1. **Escreva testes** antes ou junto com o código
2. **Siga padrão AAA** (Arrange-Act-Assert)
3. **Use nomes descritivos** para testes
4. **Mock dependencies** externas
5. **Mantenha testes** rápidos e isolados
6. **Documente** casos de teste complexos

---

**Boa cobertura de testes = Código confiável! 🧪✨**

