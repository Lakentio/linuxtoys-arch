
# LinuxToys for Arch

## 1. O que é o LinuxToys

O **LinuxToys (LT)** é um conjunto de scripts em Bash voltados para instalar e configurar softwares no Linux de forma automatizada.  
Ele oferece:

- Instalação de programas nativos (`pacman`, `apt`, `dnf`, `zypper`).  
- Instalação de Flatpaks.  
- Mensagens e janelas gráficas via `zenity`.  
- Scripts compatíveis com várias distribuições (Debian/Ubuntu, Arch/EndeavourOS, Fedora/RHEL, openSUSE).  

O objetivo é facilitar a instalação de softwares sem precisar digitar vários comandos manualmente.

---

## 2. Problema específico no Arch Linux

Nos scripts originais do LinuxToys, sempre que um programa precisa de privilégios de administrador, ele usa:

```bash
sudo comando
```

No **Arch Linux e derivados**, ocorre o seguinte erro:

```
sudo: um terminal é necessário para ler a senha; use a opção -S para ler a entrada padrão ou configure um auxiliar de askpass
sudo: uma senha é necessária
```

Motivos:

1. O `sudo` do Arch exige **TTY** para ler a senha.  
2. Os scripts do LT usam `zenity` para pedir a senha em GUI, sem TTY.  
3. A função `sudo_rq` original armazenava a senha em **variável local**, que desaparece depois que a função termina.  
4. Como resultado, o `sudo` não recebe a senha e a instalação falha.

---

## 3. Solução proposta para Arch

Criar um **fork do LinuxToys** específico para Arch/derivados, sem afetar scripts originais.

### 3.1 Captura da senha com `sudo_rq`

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

- `PASSWD` agora é **variável global e exportada**.  
- Pode ser usada em todos os subprocessos do script que precisarem de `sudo`.  
- A senha é apagada ao final com `unset PASSWD`.

---

### 3.2 Uso do `sudo` sem TTY

Nos scripts do fork Arch, todas as chamadas de `sudo` para instalar pacotes ficam assim:

```bash
echo "$PASSWD" | sudo -S pacman -S --noconfirm pacote
```

- `-S` permite que o `sudo` leia a senha da **entrada padrão** (stdin).  
- Funciona tanto em GUI quanto em terminal sem TTY.  
- Mantém compatibilidade com pacotes Arch e Chaotic-AUR.

---

### 3.3 `_install_` adaptado para Arch

```bash
elif [[ "$ID" =~ ^(arch|cachyos)$ ]] || [[ "$ID_LIKE" == *arch* ]] || [[ "$ID_LIKE" == *archlinux* ]]; then
    for pak in "${_packages[@]}"; do
        if pacman -Qi "$pak" &>/dev/null; then
            continue
        else
            echo "$PASSWD" | sudo -S pacman -S --noconfirm "$pak"
        fi
    done
```

---

### 3.4 Limpeza da senha

Ao final de cada script:

```bash
unset PASSWD
```

Isso garante que a senha não permaneça na memória após a execução.

---

## 4. Benefícios da abordagem

- Funciona **somente no Arch/derivados**, sem quebrar scripts originais.  
- Evita reescrever todos os scripts do LT.  
- Mantém compatibilidade com todas as outras distribuições.  
- A senha fica temporária em memória, sem salvar em arquivos.  
- Evita o uso de `pkexec`, mantendo segurança.

---

## 5. Manutenção do Fork Arch

1. Criar branch `arch` no repositório.  
2. Aplicar todas as alterações específicas do Arch nessa branch.  
3. Para atualizar com o upstream:
   - Atualizar a branch `main` com upstream.  
   - Fazer merge na branch `arch`, resolvendo apenas conflitos relacionados à instalação de pacotes.  
4. Documentar alterações no README do fork.  
5. Testar regularmente em Arch/EndeavourOS/Manjaro.

---

## 6. Observações finais

- Esta abordagem resolve o problema do Arch sem afetar outras distros.  
- O fork deve remover a compatibilidade com outras distros fora da base Arch, para facilitar a velocidade de desenvolvimento
