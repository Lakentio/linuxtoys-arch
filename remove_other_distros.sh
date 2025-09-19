#!/bin/bash
# Script para remover suporte para outras distribuições, mantendo apenas Arch Linux

echo "Removendo suporte para outras distribuições, mantendo apenas Arch Linux..."

# Lista de arquivos que precisam ser processados
files=(
    "p3/scripts/game/steam.sh"
    "p3/scripts/game/hgl.sh"
    "p3/scripts/game/lsfg.sh"
    "p3/scripts/extra/touchegg.sh"
    "p3/scripts/drivers/nv-pacman-prop.sh"
    "p3/scripts/drivers/nv-pacman-470.sh"
    "p3/scripts/drivers/nv-pacman.sh"
    "p3/scripts/drivers/bcm.sh"
    "p3/scripts/devs/ides/code.sh"
    "p3/scripts/devs/ides/sublimetext.sh"
    "p3/scripts/utils/privacy/windscribe-vpn.sh"
    "p3/scripts/psypicks.sh"
    "p3/scripts/pdefaults.sh"
    "p3/scripts/pdefaults-ostree.sh"
    "p3/scripts/psypicks-ostree.sh"
    "p3/scripts/psypicks.sh"
    "p3/scripts/unoptimize.sh"
    "p3/scripts/unoptimize-ostree.sh"
)

for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "Processando $file..."
        
        # Criar backup
        cp "$file" "$file.backup"
        
        # Remover condições de Fedora/RHEL
        sed -i '/if command -v rpm-ostree/,/^fi$/d' "$file"
        sed -i '/if.*fedora/,/^fi$/d' "$file"
        sed -i '/if.*rhel/,/^fi$/d' "$file"
        
        # Remover condições de Debian/Ubuntu
        sed -i '/if.*debian/,/^fi$/d' "$file"
        sed -i '/if.*ubuntu/,/^fi$/d' "$file"
        
        # Remover condições de SUSE
        sed -i '/if.*suse/,/^fi$/d' "$file"
        
        # Remover condições de Arch (manter apenas o código)
        sed -i '/elif.*arch/,/^fi$/d' "$file"
        sed -i '/elif.*cachyos/,/^fi$/d' "$file"
        
        # Remover else blocks que usam flatpak
        sed -i '/else/,/^fi$/d' "$file"
        
        # Limpar linhas vazias duplicadas
        sed -i '/^$/N;/^\n$/d' "$file"
        
        echo "✅ $file processado"
    else
        echo "⚠️  $file não encontrado"
    fi
done

echo "Processamento concluído!"
echo "Arquivos de backup criados com extensão .backup"
