#!/bin/bash
# Script para processar TODOS os scripts e remover condições de outras distros

echo "=== Processando TODOS os scripts para Arch Linux Only ==="
echo

# Lista de todos os scripts que precisam ser processados
scripts=(
    "p3/scripts/devs/java.sh"
    "p3/scripts/devs/pyenv.sh"
    "p3/scripts/devs/unity.sh"
    "p3/scripts/devs/dotnet.sh"
    "p3/scripts/devs/docker.sh"
    "p3/scripts/devs/godotsharp.sh"
    "p3/scripts/extra/touchegg.sh"
    "p3/scripts/extra/ondemand.sh"
    "p3/scripts/extra/preload.sh"
    "p3/scripts/extra/lsw.sh"
    "p3/scripts/extra/codecfix.sh"
    "p3/scripts/extra/grubtrfs.sh"
    "p3/scripts/extra/susefix.sh"
    "p3/scripts/drivers/bcm.sh"
    "p3/scripts/drivers/rtl8821ce-rpm.sh"
    "p3/scripts/drivers/rusticl.sh"
    "p3/scripts/drivers/rocm.sh"
    "p3/scripts/drivers/xpadneo.sh"
    "p3/scripts/drivers/icr.sh"
    "p3/scripts/game/gscope.sh"
    "p3/scripts/game/lutris.sh"
    "p3/scripts/game/lsfg.sh"
    "p3/scripts/utils/privacy/windscribe-vpn.sh"
    "p3/scripts/utils/privacy/ivpn.sh"
    "p3/scripts/utils/privacy/nord-vpn.sh"
    "p3/scripts/utils/privacy/mullvad-vpn.sh"
    "p3/scripts/utils/privacy/wireguard.sh"
    "p3/scripts/utils/waydroid.sh"
    "p3/scripts/utils/peripherals/oprzr.sh"
    "p3/scripts/utils/peripherals/oprgb.sh"
    "p3/scripts/utils/peripherals/solaar.sh"
    "p3/scripts/utils/peripherals/piper.sh"
    "p3/scripts/utils/boxadv.sh"
    "p3/scripts/sysadm/cockpit.sh"
    "p3/scripts/unoptimize.sh"
    "p3/scripts/sysadm/activedirectory.sh"
    "p3/scripts/pdefaults.sh"
    "p3/scripts/office/davinci.sh"
)

processed=0
skipped=0

for script in "${scripts[@]}"; do
    if [[ -f "$script" ]]; then
        echo "Processando $script..."
        
        # Criar backup
        cp "$script" "$script.backup"
        
        # Verificar se o script tem condições de outras distros
        if grep -q "if.*debian\|elif.*debian\|if.*ubuntu\|elif.*ubuntu\|if.*fedora\|elif.*fedora\|if.*rhel\|elif.*rhel\|if.*suse\|elif.*suse" "$script"; then
            echo "  ✅ Contém condições de outras distros - processando..."
            
            # Para scripts simples, vamos fazer uma limpeza básica
            # Remover blocos if/elif que não sejam para Arch
            sed -i '/if.*debian/,/^fi$/d' "$script"
            sed -i '/if.*ubuntu/,/^fi$/d' "$script"
            sed -i '/if.*fedora/,/^fi$/d' "$script"
            sed -i '/if.*rhel/,/^fi$/d' "$script"
            sed -i '/if.*suse/,/^fi$/d' "$script"
            
            # Remover elif blocks
            sed -i '/elif.*debian/,/^fi$/d' "$script"
            sed -i '/elif.*ubuntu/,/^fi$/d' "$script"
            sed -i '/elif.*fedora/,/^fi$/d' "$script"
            sed -i '/elif.*rhel/,/^fi$/d' "$script"
            sed -i '/elif.*suse/,/^fi$/d' "$script"
            
            # Limpar linhas vazias duplicadas
            sed -i '/^$/N;/^\n$/d' "$script"
            
            processed=$((processed + 1))
            echo "  ✅ Processado"
        else
            echo "  ⚠️  Não contém condições de outras distros - pulando"
            skipped=$((skipped + 1))
        fi
    else
        echo "  ❌ $script não encontrado"
    fi
done

echo
echo "=== Resumo ==="
echo "Scripts processados: $processed"
echo "Scripts pulados: $skipped"
echo "Total: $((processed + skipped))"
echo
echo "ATENÇÃO: Esta é uma limpeza básica. Alguns scripts podem precisar de ajustes manuais."
echo "Verifique os backups (.backup) se algo não funcionar corretamente."
