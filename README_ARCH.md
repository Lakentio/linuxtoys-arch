# LinuxToys - Arch Linux Only

Esta é uma versão específica do LinuxToys **EXCLUSIVAMENTE** para **Arch Linux** e distribuições derivadas (EndeavourOS, Manjaro, CachyOS, etc.).

**IMPORTANTE**: Esta versão remove completamente o suporte para outras distribuições (Debian, Ubuntu, Fedora, SUSE, etc.) para focar apenas no Arch Linux.

## Problema Resolvido

O LinuxToys original apresenta problemas no Arch Linux devido ao comportamento específico do `sudo` nesta distribuição. O erro típico é:

```
sudo: um terminal é necessário para ler a senha; use a opção -S para ler a entrada padrão ou configure um auxiliar de askpass
sudo: uma senha é necessária
```

## Solução Implementada

### 1. Função `sudo_rq` Corrigida

A função `sudo_rq` foi modificada para:
- Armazenar a senha em uma variável global `PASSWD` exportada
- Permitir que subprocessos do script acessem a senha
- Limpar a senha automaticamente ao final

```bash
sudo_rq () { 
    PASSWD=$(zenity --password --title="Autenticação requerida") || fatal "Password dialog was cancelled or failed."

    if echo "$PASSWD" | timeout 5 sudo -S -p "" true 2>/dev/null; then
        sudo -v 2>/dev/null
        export PASSWD   # torna a senha disponível para subprocessos do script
        return 0
    else
        unset PASSWD
        fatal "Wrong password. Do you have sudo?"
    fi
}
```

### 2. Uso do `sudo -S`

Todos os comandos `sudo` foram modificados para usar `echo "$PASSWD" | sudo -S`:

```bash
# Antes
sudo pacman -S --noconfirm pacote

# Depois
echo "$PASSWD" | sudo -S pacman -S --noconfirm pacote
```

### 3. Limpeza Automática

Todos os scripts agora incluem `unset PASSWD` no final para garantir que a senha não permaneça na memória.

## Scripts Corrigidos

Os seguintes scripts foram corrigidos para funcionar corretamente no Arch:

- `p3/libs/linuxtoys.lib` - Biblioteca principal
- `p3/scripts/utils/archupd.sh` - Atualizador do Arch
- `p3/scripts/game/hgl.sh` - Heroic Games Launcher
- `p3/scripts/drivers/nv-pacman.sh` - Drivers NVIDIA
- `p3/scripts/drivers/nv-pacman-470.sh` - Drivers NVIDIA 470
- `p3/scripts/drivers/nv-pacman-prop.sh` - Drivers NVIDIA proprietários
- `p3/scripts/drivers/bcm.sh` - Drivers Broadcom
- `p3/scripts/extra/touchegg.sh` - TouchEgg
- `p3/scripts/game/lsfg.sh` - Linux Steam Game Fix
- `p3/scripts/devs/ides/code.sh` - Visual Studio Code
- `p3/scripts/devs/ides/sublimetext.sh` - Sublime Text
- `p3/scripts/utils/privacy/windscribe-vpn.sh` - Windscribe VPN
- `p3/scripts/psypicks.sh` - PsyPicks

## Como Usar

1. Clone este repositório
2. Mude para a branch `arch`:
   ```bash
   git checkout arch
   ```
3. Execute o LinuxToys normalmente:
   ```bash
   ./p3/run.py
   ```

## Compatibilidade

Esta versão é **EXCLUSIVAMENTE** para:
- **Arch Linux**
- **EndeavourOS**
- **Manjaro**
- **CachyOS**
- **Garuda Linux**
- **ArcoLinux**
- Outras distribuições baseadas em Arch

**NÃO SUPORTA**:
- Debian/Ubuntu
- Fedora/RHEL
- openSUSE/SUSE
- Outras distribuições não baseadas em Arch

## Manutenção

Para manter esta branch atualizada com o upstream:

1. Atualize a branch `main` com o upstream
2. Faça merge na branch `arch`
3. Resolva apenas conflitos relacionados à instalação de pacotes
4. Teste em ambiente Arch/EndeavourOS/Manjaro

## Segurança

- A senha é armazenada temporariamente em memória
- A senha é limpa automaticamente ao final de cada script
- Não há persistência da senha em arquivos
- Mantém a segurança do sistema

## Créditos

Esta correção foi desenvolvida seguindo as especificações documentadas em `linux_toys_arch_fix.md`.
