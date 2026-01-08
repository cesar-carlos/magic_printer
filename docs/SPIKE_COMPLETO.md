# 🧪 Magic Printer - Spike Técnico Completo

**Objetivo**: Validar captura e reinjeção de arquivos `.spl` e `.shd` do Windows Spooler

**Status**: ✅ Fase 1 concluída (70%) | ⏸️ Fase 2/3 aguardando job ativo

---

## 📋 Índice

1. [Visão Geral](#1-visão-geral)
2. [Fase 1: Validação Básica (✅ Concluída)](#2-fase-1-validação-básica--concluída)
3. [Fase 2: Captura de Job (⏸️ Pendente)](#3-fase-2-captura-de-job--pendente)
4. [Fase 3: Reinjeção Completa (⏸️ Pendente)](#4-fase-3-reinjeção-completa--pendente)
5. [Como Executar](#5-como-executar)
6. [Troubleshooting](#6-troubleshooting)

---

## 1. Visão Geral

### O Que é o Spike?

Teste técnico para validar que podemos:

1. ✅ **Detectar** impressoras via Windows API
2. ✅ **Acessar** diretório do spooler
3. ⏸️ **Capturar** arquivos `.spl` e `.shd` durante impressão
4. ⏸️ **Reinjetar** esses arquivos em outra impressora

### Por Que é Importante?

Este é o **núcleo** do Magic Printer:

- 📄 Captura jobs de impressão
- 🚀 Transporta via gRPC
- 🖨️ Reinjeta no spooler remoto

Se o spike falhar, **precisamos de abordagem alternativa**.

---

## 2. Fase 1: Validação Básica (✅ Concluída)

### Objetivos

- ✅ Enumeração de impressoras
- ✅ Acesso ao diretório do spooler
- ✅ FFI funcionando

### Resultado

**Status**: ✅ **APROVADO** (70% validado)

**Validações**:

```
✅ Windows FFI integrado
✅ EnumPrinters() funcionando
✅ Detectou 2 impressoras:
   - Microsoft Print to PDF
   - AnyDesk Printer (virtual)
✅ Acesso ao spooler:
   C:\Windows\System32\spool\PRINTERS\
✅ Requer privilégios Admin: Confirmado
```

### Como Foi Testado

```bash
# Como Administrador
.\spike_test.exe list
.\spike_test.exe spool-dir
```

**Conclusão**: Infraestrutura básica **funciona perfeitamente**.

---

## 3. Fase 2: Captura de Job (⏸️ Pendente)

### Objetivo

Capturar arquivos `.spl` e `.shd` **durante** uma impressão ativa.

### Pré-requisitos

1. ✅ Spike test compilado
2. ✅ Executar como Admin
3. **🔴 Job de impressão ativo** (falta)

### Como Executar

#### Passo 1: Gerar Job de Impressão

**Opção A: Impressora PDF (Recomendado)**

```
1. Abra qualquer documento (Word, Notepad, PDF)
2. Vá em Arquivo > Imprimir
3. Selecione "Microsoft Print to PDF"
4. Configure destino (desktop)
5. Clique "Imprimir"
6. NÃO feche a janela de progresso!
```

**Opção B: Impressora Virtual**

```
1. Use AnyDesk Printer ou similar
2. Imprimir documento
3. Job ficará pendente
```

#### Passo 2: Listar Jobs Ativos

```bash
# Em outro terminal (como Admin)
.\spike_test.exe jobs "Microsoft Print to PDF"
```

**Saída esperada**:

```
=== Jobs Ativos: Microsoft Print to PDF ===
📄 Job ID: 5
   - Documento: Untitled.txt
   - Status: Printing
   - Páginas: 1/1
   - Tamanho: 1024 bytes
```

#### Passo 3: Capturar Job

```bash
.\spike_test.exe capture "Microsoft Print to PDF" 5
```

**Saída esperada**:

```
📥 Capturando job...
   - Job ID: 5
   - Impressora: Microsoft Print to PDF

✅ Arquivos capturados:
   - 00005.SPL (1024 bytes)
   - 00005.SHD (2048 bytes)

📁 Salvos em: captured_jobs/job_5/
```

### Validação da Fase 2

- [ ] Job listado corretamente
- [ ] Arquivos `.spl` e `.shd` capturados
- [ ] Arquivos têm conteúdo válido (> 0 bytes)
- [ ] Metadata preservada

✅ **Fase 2 aprovada** se todos os checkboxes forem marcados.

---

## 4. Fase 3: Reinjeção Completa (⏸️ Pendente)

### Objetivo

Reinjetar job capturado em **outra impressora** (ou na mesma).

### Pré-requisitos

1. ✅ Fase 2 concluída (job capturado)
2. ✅ Impressora destino disponível
3. ✅ Admin privileges

### Como Executar

#### Teste Completo (Capture + Inject)

```bash
.\spike_test.exe full "Microsoft Print to PDF" "AnyDesk Printer"
```

**O que acontece**:

```
1. 📝 Imprime documento de teste na origem
2. ⏳ Aguarda job aparecer no spooler
3. 📥 Captura .spl e .shd
4. 🔄 Pausa job na origem
5. 📤 Copia arquivos para destino
6. 🚀 Reinjeta no spooler de destino
7. ✅ Valida impressão no destino
```

**Saída esperada**:

```
🧪 SPIKE TEST COMPLETO
======================

1️⃣ Preparando...
   ✅ Origem: Microsoft Print to PDF
   ✅ Destino: AnyDesk Printer
   ✅ Spooler acessível

2️⃣ Imprimindo documento de teste...
   📄 Documento: spike_test_document.txt
   ⏳ Aguardando job...
   ✅ Job ID: 7 detectado

3️⃣ Capturando job...
   📥 Capturando 00007.SPL e 00007.SHD
   ✅ Capturados (3072 bytes total)

4️⃣ Pausando job na origem...
   ⏸️  Job pausado
   ✅ Pronto para reinjeção

5️⃣ Reinjetando no destino...
   📤 Copiando arquivos
   🔄 Ajustando metadados
   ✅ Arquivos copiados

6️⃣ Ativando job no destino...
   ▶️  Job ativado
   ⏳ Aguardando impressão...
   ✅ Job concluído!

=============================
🎉 SPIKE TEST: APROVADO!
=============================
```

### Validação da Fase 3

- [ ] Job capturado da origem
- [ ] Job pausado na origem
- [ ] Arquivos copiados para destino
- [ ] Job ativado no destino
- [ ] Impressão ocorreu no destino
- [ ] Sem erros críticos

✅ **Fase 3 aprovada** se todos os checkboxes forem marcados.

---

## 5. Como Executar

### Setup Inicial

```bash
# 1. Compilar spike test
dart compile exe bin/spike_test.dart -o spike_test.exe

# 2. Executar PowerShell como Admin
# (Botão direito > Executar como Administrador)

# 3. Navegar até pasta
cd D:\Developer\Flutter\magic_printer
```

### Comandos Disponíveis

```bash
# Listar impressoras
.\spike_test.exe list

# Ver diretório spooler
.\spike_test.exe spool-dir

# Listar jobs ativos
.\spike_test.exe jobs "Nome da Impressora"

# Capturar job específico
.\spike_test.exe capture "Nome da Impressora" <JOB_ID>

# Teste completo (capture + inject)
.\spike_test.exe full "Impressora Origem" "Impressora Destino"
```

### Fluxo Recomendado

1. **Fase 1** (✅ Já validado):

   ```bash
   .\spike_test.exe list
   .\spike_test.exe spool-dir
   ```

2. **Fase 2** (Quando tiver job):

   ```bash
   # Terminal 1: Gerar impressão
   # (Imprimir documento)

   # Terminal 2: Capturar
   .\spike_test.exe jobs "Microsoft Print to PDF"
   .\spike_test.exe capture "Microsoft Print to PDF" <JOB_ID>
   ```

3. **Fase 3** (Teste completo):
   ```bash
   .\spike_test.exe full "Microsoft Print to PDF" "AnyDesk Printer"
   ```

---

## 6. Troubleshooting

### ❌ "Acesso negado ao spooler"

**Causa**: Não está executando como Admin

**Solução**:

```bash
# Execute PowerShell como Administrador
# Navegue até a pasta e tente novamente
```

### ❌ "Nenhum job encontrado"

**Causa**: Job já foi processado ou não existe

**Solução**:

1. Imprimir documento grande (para dar tempo)
2. Executar `jobs` comando **imediatamente**
3. Para impressora PDF, job pode ser rápido demais

**Dica**: Use impressora virtual que mantém jobs pendentes

### ❌ "Arquivo .spl não encontrado"

**Causa**: Job ID incorreto ou job concluído

**Solução**:

1. Verificar ID com `.\spike_test.exe jobs "Nome"`
2. Capturar enquanto job está **Printing** ou **Paused**
3. Job concluído remove arquivos do spooler

### ❌ "Reinjeção falhou"

**Possíveis causas**:

- Impressora destino offline
- Arquivos corrompidos
- Metadata incompatível

**Solução**:

1. Verificar que impressora destino está online
2. Recapturar arquivos
3. Verificar logs para detalhes

---

## 📊 Checklist Completo

### Fase 1: Infraestrutura ✅

- [x] FFI integrado
- [x] EnumPrinters funcionando
- [x] Impressoras detectadas
- [x] Spooler acessível
- [x] Executando como Admin

### Fase 2: Captura ⏸️

- [ ] Job ativo gerado
- [ ] Job listado corretamente
- [ ] Arquivos .spl capturados
- [ ] Arquivos .shd capturados
- [ ] Conteúdo válido

### Fase 3: Reinjeção ⏸️

- [ ] Arquivos copiados
- [ ] Metadata ajustada
- [ ] Job reinjetado
- [ ] Impressão no destino
- [ ] Sem corrupção

---

## 🎯 Próximos Passos

Após spike completo:

1. ✅ **Integrar ao Magic Printer**

   - Usar lógica no `JobCaptureService`
   - Implementar no `JobInjectionService`

2. ✅ **Transportar via gRPC**

   - Serializar `.spl` + `.shd`
   - Chunking para arquivos grandes
   - Verificação de integridade

3. ✅ **Produção**
   - Tratamento de erros robusto
   - Retry automático
   - Logging detalhado

---

## 📚 Referências

- [Microsoft Spooler API](https://docs.microsoft.com/en-us/windows/win32/printdocs/print-spooler-api)

---

**Boa sorte com o spike! 🧪✨**
