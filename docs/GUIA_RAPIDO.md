# 🚀 Magic Printer - Guia de Início Rápido

**Tempo estimado**: 10-15 minutos

Este guia vai te ajudar a **instalar**, **configurar** e **usar** o Magic Printer rapidamente.

---

## 📋 Índice

1. [Instalação](#1-instalação)
2. [Primeira Execução](#2-primeira-execução)
3. [Modo Host (Compartilhar Impressoras)](#3-modo-host-compartilhar-impressoras)
4. [Modo Guest (Usar Impressoras Remotas)](#4-modo-guest-usar-impressoras-remotas)
5. [Solução de Problemas](#5-solução-de-problemas)

---

## 1. Instalação

### Pré-requisitos

Antes de começar, certifique-se de ter:

#### Sistema Operacional
- ✅ **Windows 10** (qualquer versão) ou **Windows 11**
- ✅ **Windows Server 2012 R2** ou superior (2016, 2019, 2022)
- ✅ **Arquitetura x64 (64 bits)**

#### Dependências de Runtime
- ✅ **.NET Runtime 8.0** ou superior (Windows 10/11 geralmente pré-instalado)
- ✅ **Microsoft Visual C++ 2015-2019 Redistributable (x64)** - apenas para Windows Server 2012 R2

#### Ferramentas de Desenvolvimento
- ✅ **Flutter SDK** 3.10.4+ instalado ([Download](https://flutter.dev/docs/get-started/install/windows))
- ✅ **Git** instalado ([Download](https://git-scm.com/download/win))

> **Nota**: Para mais detalhes sobre compatibilidade, consulte [docs/COMPATIBILIDADE.md](docs/COMPATIBILIDADE.md)

### Passos de Instalação

#### 1.1. Clone o Repositório

```bash
# Abra o PowerShell ou CMD
git clone https://github.com/seu-usuario/magic_printer.git
cd magic_printer
```

#### 1.2. Instale as Dependências

```bash
flutter pub get
```

**Saída esperada**:

```
Resolving dependencies...
Got dependencies!
```

#### 1.3. Verifique a Instalação

```bash
flutter analyze
```

**Saída esperada**:

```
Analyzing magic_printer...
No issues found! (ran in 1.2s)
```

✅ **Instalação concluída com sucesso!**

---

## 2. Primeira Execução

### 2.1. Execute a Aplicação

```bash
flutter run -d windows
```

**Primeira vez**: Pode demorar alguns minutos para compilar.

### 2.2. Tela Inicial

Ao abrir, você verá a **tela inicial** do Magic Printer com as opções:

```
┌─────────────────────────────────────┐
│      🖨️ Magic Printer                │
├─────────────────────────────────────┤
│  [ Catálogo de Impressoras ]        │
│  [ Minhas Impressoras ]             │
│  [ Configurações ]                  │
│  [ Histórico ]                      │
└─────────────────────────────────────┘
```

---

## 3. Modo Host (Compartilhar Impressoras)

**Cenário**: Você quer **compartilhar suas impressoras** na rede para outros usuários.

### 3.1. Abra as Configurações

1. Na tela inicial, clique em **"Configurações"**
2. Navegue até a seção **"Modo Host"**

### 3.2. Ative o Modo Host

```
┌─────────────────────────────────────┐
│  ⚙️ Configurações - Modo Host        │
├─────────────────────────────────────┤
│  [ ] Ativar Modo Host               │
│                                     │
│  Porta gRPC: [50051]                │
│  IP: [Auto-detectar]                │
│                                     │
│  [Salvar]                           │
└─────────────────────────────────────┘
```

3. **Marque** a opção "Ativar Modo Host"
4. **Configure** a porta (padrão: `50051`)
5. Clique em **"Salvar"**

### 3.3. Selecione Impressoras para Compartilhar

1. Navegue para **"Minhas Impressoras"**
2. Você verá uma lista de impressoras locais:

```
┌─────────────────────────────────────┐
│  🖨️ Minhas Impressoras               │
├─────────────────────────────────────┤
│  ☑ HP LaserJet Pro                  │
│  ☑ Epson EcoTank                    │
│  ☐ Microsoft Print to PDF           │
│                                     │
│  [Compartilhar Selecionadas]        │
└─────────────────────────────────────┘
```

3. **Marque** as impressoras que deseja compartilhar
4. Clique em **"Compartilhar Selecionadas"**

### 3.4. Configure Grupos e Permissões (Opcional)

Para cada impressora compartilhada:

1. Clique no **ícone de configurações** ao lado da impressora
2. Configure:
   - **Grupo**: Nome do grupo (ex: "Marketing", "TI")
   - **Senha**: Senha de acesso (opcional)
   - **Permissões**: Quem pode imprimir

```
┌─────────────────────────────────────┐
│  ⚙️ HP LaserJet Pro - Configurações  │
├─────────────────────────────────────┤
│  Nome: [HP LaserJet Pro]            │
│  Grupo: [Marketing]                 │
│  Senha: [••••••••]                  │
│                                     │
│  Permissões:                        │
│  ☑ Qualquer um pode imprimir        │
│  ☐ Apenas grupo pode imprimir       │
│                                     │
│  [Salvar]                           │
└─────────────────────────────────────┘
```

3. Clique em **"Salvar"**

### 3.5. Inicie o Servidor gRPC

1. Volte para **"Configurações"** > **"Modo Host"**
2. Clique em **"Iniciar Servidor"**

**Resultado**:

```
✅ Servidor gRPC iniciado em 192.168.1.100:50051
```

✅ **Suas impressoras agora estão compartilhadas na rede!**

---

## 4. Modo Guest (Usar Impressoras Remotas)

**Cenário**: Você quer **usar impressoras** compartilhadas por outros usuários na rede.

### 4.1. Descubra Hosts na Rede

1. Na tela inicial, clique em **"Catálogo de Impressoras"**
2. Clique em **"Descobrir Hosts"**

```
┌─────────────────────────────────────┐
│  🔍 Catálogo de Impressoras          │
├─────────────────────────────────────┤
│  [Descobrir Hosts]                  │
│                                     │
│  Buscando hosts na rede...          │
│  ⏳ Aguarde...                       │
└─────────────────────────────────────┘
```

### 4.2. Selecione um Host

Após a descoberta, você verá uma lista de hosts disponíveis:

```
┌─────────────────────────────────────┐
│  🔍 Hosts Disponíveis                │
├─────────────────────────────────────┤
│  📍 PC-MARKETING                     │
│     IP: 192.168.1.100:50051         │
│     2 impressoras disponíveis       │
│                                     │
│  📍 PC-TI                            │
│     IP: 192.168.1.101:50051         │
│     3 impressoras disponíveis       │
│                                     │
└─────────────────────────────────────┘
```

3. **Clique** em um host para ver as impressoras

### 4.3. Autentique (se necessário)

Se a impressora estiver protegida por senha:

```
┌─────────────────────────────────────┐
│  🔐 Autenticação Necessária          │
├─────────────────────────────────────┤
│  Impressora: HP LaserJet Pro        │
│  Grupo: Marketing                   │
│                                     │
│  Senha: [__________]                │
│                                     │
│  [Conectar]  [Cancelar]             │
└─────────────────────────────────────┘
```

4. Digite a **senha do grupo**
5. Clique em **"Conectar"**

### 4.4. Adicione ao Catálogo

1. Após autenticação, você verá os detalhes da impressora:

```
┌─────────────────────────────────────┐
│  🖨️ HP LaserJet Pro                  │
├─────────────────────────────────────┤
│  Host: PC-MARKETING                 │
│  Status: 🟢 Online                   │
│  Localização: Sala 201              │
│                                     │
│  [Adicionar ao Meu Catálogo]        │
└─────────────────────────────────────┘
```

2. Clique em **"Adicionar ao Meu Catálogo"**

✅ **Impressora adicionada com sucesso!**

### 4.5. Imprima!

Agora você pode **imprimir** normalmente:

1. Abra qualquer documento/aplicativo
2. Vá em **Arquivo** > **Imprimir**
3. Selecione **"HP LaserJet Pro (Magic Printer)"**
4. Configure as opções de impressão
5. Clique em **"Imprimir"**

**O Magic Printer irá**:

- ✅ Capturar o job de impressão
- ✅ Transportar via gRPC para o Host
- ✅ Reinjetar no spooler do Host
- ✅ Enviar para a impressora física

---

## 5. Solução de Problemas

### ❌ "Servidor gRPC não iniciou"

**Possíveis causas**:

- Porta já em uso
- Firewall bloqueando

**Solução**:

```bash
# Verificar se porta está em uso
netstat -ano | findstr :50051

# Se estiver em uso, altere a porta nas configurações
```

### ❌ "Nenhum host encontrado na rede"

**Possíveis causas**:

- Firewall bloqueando multicast
- Hosts não estão no mesmo segmento de rede

**Solução**:

1. Verifique se o firewall permite tráfego na porta `50051`
2. Adicione manualmente o host pelo IP:
   - **Catálogo** > **"Adicionar Host Manualmente"**
   - Digite: `192.168.1.100:50051`

### ❌ "Falha ao imprimir"

**Possíveis causas**:

- Conexão perdida com o host
- Impressora offline no host
- Problema de autenticação

**Solução**:

1. Verifique se o host está online
2. No host, confirme que a impressora está online
3. Tente reconectar à impressora

### ❌ "Permissão negada ao acessar spooler"

**Possíveis causas**:

- Magic Printer não foi executado como Administrador

**Solução**:

```bash
# Execute o PowerShell como Administrador
# Navegue até a pasta do projeto
cd D:\Developer\Flutter\magic_printer

# Execute
flutter run -d windows
```

---

## 📊 Resumo de Comandos

### Instalação

```bash
git clone https://github.com/seu-usuario/magic_printer.git
cd magic_printer
flutter pub get
flutter analyze
```

### Execução

```bash
flutter run -d windows
```

### Spike Test (Testes técnicos)

```bash
# Compilar
dart compile exe bin/spike_test.dart -o spike_test.exe

# Listar impressoras
.\spike_test.exe list

# Ver spooler
.\spike_test.exe spool-dir
```

---

## 🎯 Próximos Passos

Agora que você configurou o Magic Printer:

1. ✅ **Explore**: Teste compartilhar e usar impressoras
2. ✅ **Configure**: Ajuste grupos e permissões
3. ✅ **Monitore**: Veja o histórico de impressões
4. ✅ **Documente**: Leia mais em `docs/README.md`

---

## 📚 Documentação Adicional

- 📄 [README.md](../README.md) - Visão geral do projeto
- 📄 [README.md (docs)](README.md) - Índice da documentação
- 📄 [README.md (docs)](README.md) - Índice da documentação

---

## 🤝 Precisa de Ajuda?

- 💬 **Issues**: [GitHub Issues](https://github.com/seu-usuario/magic_printer/issues)
- 📧 **Email**: suporte@magicprinter.com
- 📖 **Docs**: `docs/` folder

---

**Bom uso do Magic Printer! 🖨️✨**
