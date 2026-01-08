# Instalação e Setup (MVP LAN)

## Objetivo

Guiar a instalação e a configuração do MVP com o mínimo de atrito, reduzindo erros comuns (driver, permissões, firewall, host offline, spooler travado).

## Escopo suportado

- **Suportado (MVP)**: rede local (LAN), conexão direta `Client -> Host` via `IP:porta`.
- **Não suportado (MVP)**: host “na internet” (WAN) sem VPN/relay. Isso é tratado como fase futura por causa de NAT, firewall, segurança (TLS/mTLS) e confiabilidade.

## Pré-requisitos (antes de começar)

- O **Host** deve ficar ligado e na rede enquanto a impressora for usada.
- A impressora física deve estar funcional no **Host** (imprime localmente).
- O **Client** deve ter o **driver correto** instalado para a impressora lógica (o MVP prioriza drivers já instalados).
- Criar/alterar impressoras/portas no Windows pode exigir **permissão de administrador**.
- A porta do Host (ex.: `50051`) deve estar liberada no **firewall do Host**.

## Setup do Host (máquina que tem a impressora física)

- Defina a porta do serviço do Host (`host.port`).
- Garanta conectividade:
  - `IP` fixo ou DHCP reservado (recomendado para reduzir suporte).
  - regra de firewall liberando `TCP` na porta do Host.
- No app:
  - selecione a(s) impressora(s) local(is) que serão compartilhadas.
  - gere/registre o token de acesso (MVP) e os grupos/permissões (se aplicável).
- Validação rápida:
  - confirme que o spooler está ativo.
  - confirme que a impressora local imprime um teste.

## Setup do Client (máquina que vai imprimir)

- Adicione o Host (informar `IP:porta` e token).
- Selecione a impressora remota no catálogo.
- Rode o assistente de setup:
  - **Opção A (recomendado)**: criar impressora lógica (driver já instalado + porta controlada).
  - **Opção B (avançado)**: converter impressora existente (trocar apenas a porta).
- Execute o teste final:
  - conectividade `IP:porta`
  - permissão (se habilitado)
  - impressão de página de teste (quando disponível)

## Troubleshooting rápido (erros mais comuns)

- **`E_HOST_OFFLINE` / `E_HOST_UNREACHABLE`**: host desligado, IP incorreto ou rede indisponível.
- **`E_PORT_BLOCKED`**: firewall bloqueando a porta do Host.
- **`E_CONFIG_DRIVER_MISSING`**: driver não instalado no Client.
- **`E_CONFIG_PERMISSION_DENIED`**: operação exige executar como administrador.
- **`E_SPOOLER_STOPPED` / `E_SPOOLER_QUEUE_STUCK`**: spooler/fila com problema no Host (ou no Client, dependendo do ponto do fluxo).

## WAN/Internet (nota de arquitetura)

Se precisar atingir a internet, a abordagem mais segura e previsível é:

- **VPN** (ex.: WireGuard/Tailscale) para “transformar WAN em LAN” e manter o modelo `IP:porta`.
- Alternativa (fase futura): **relay**/broker (servidor intermediário) + **TLS/mTLS** + políticas de reconexão/backpressure.
