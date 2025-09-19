#!/bin/bash
# Script inteligente para processar scripts restantes

echo "=== Processando Scripts Restantes para Arch Linux Only ==="
echo

# Lista de scripts restantes que precisam ser processados
remaining_scripts=(
    "p3/scripts/devs/pyenv.sh"
    "p3/scripts/devs/unity.sh"
    "p3/scripts/devs/dotnet.sh"
    "p3/scripts/devs/docker.sh"
    "p3/scripts/devs/godotsharp.sh"
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

for script in "${remaining_scripts[@]}"; do
    if [[ -f "$script" ]]; then
        echo "Analisando $script..."
        
        # Verificar se o script tem condições de outras distros
        if grep -q "if.*debian\|elif.*debian\|if.*ubuntu\|elif.*ubuntu\|if.*fedora\|elif.*fedora\|if.*rhel\|elif.*rhel\|if.*suse\|elif.*suse" "$script"; then
            echo "  ✅ Contém condições de outras distros"
            
            # Criar backup
            cp "$script" "$script.backup"
            
            # Estratégia: Remover blocos condicionais e manter apenas código Arch
            # Primeiro, vamos identificar se há código específico para Arch
            if grep -q "arch\|pacman" "$script"; then
                echo "  📝 Contém código Arch - processando..."
                
                # Remover blocos if/elif que não sejam para Arch
                # Esta é uma abordagem conservadora - remover apenas os blocos problemáticos
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
                echo "  ⚠️  Não contém código Arch específico - pulando"
                skipped=$((skipped + 1))
            fi
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
echo "ATENÇÃO: Esta é uma limpeza automática. Verifique os scripts processados manualmente."
echo "Backups criados com extensão .backup"
