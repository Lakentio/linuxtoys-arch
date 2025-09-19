#!/bin/bash
# Script para corrigir todos os scripts do LinuxToys para Arch Linux
# Substitui chamadas diretas de sudo por echo "$PASSWD" | sudo -S

echo "Corrigindo scripts para Arch Linux..."

# Lista de arquivos que precisam ser corrigidos
files=(
    "p3/scripts/utils/privacy/windscribe-vpn.sh"
    "p3/scripts/psypicks.sh"
    "p3/scripts/game/lsfg.sh"
    "p3/scripts/extra/touchegg.sh"
    "p3/scripts/drivers/nv-pacman-prop.sh"
    "p3/scripts/drivers/nv-pacman-470.sh"
    "p3/scripts/devs/ides/code.sh"
    "p3/scripts/devs/ides/sublimetext.sh"
    "p3/scripts/drivers/bcm.sh"
)

for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "Corrigindo $file..."
        
        # Substituir sudo pacman por echo "$PASSWD" | sudo -S pacman
        sed -i 's/sudo pacman/echo "$PASSWD" | sudo -S pacman/g' "$file"
        
        # Substituir sudo mkinitcpio por echo "$PASSWD" | sudo -S mkinitcpio
        sed -i 's/sudo mkinitcpio/echo "$PASSWD" | sudo -S mkinitcpio/g' "$file"
        
        # Substituir sudo systemctl por echo "$PASSWD" | sudo -S systemctl
        sed -i 's/sudo systemctl/echo "$PASSWD" | sudo -S systemctl/g' "$file"
        
        # Substituir sudo modprobe por echo "$PASSWD" | sudo -S modprobe
        sed -i 's/sudo modprobe/echo "$PASSWD" | sudo -S modprobe/g' "$file"
        
        # Substituir sudo rm por echo "$PASSWD" | sudo -S rm
        sed -i 's/sudo rm/echo "$PASSWD" | sudo -S rm/g' "$file"
        
        # Substituir sudo cp por echo "$PASSWD" | sudo -S cp
        sed -i 's/sudo cp/echo "$PASSWD" | sudo -S cp/g' "$file"
        
        # Substituir sudo chmod por echo "$PASSWD" | sudo -S chmod
        sed -i 's/sudo chmod/echo "$PASSWD" | sudo -S chmod/g' "$file"
        
        # Substituir sudo chown por echo "$PASSWD" | sudo -S chown
        sed -i 's/sudo chown/echo "$PASSWD" | sudo -S chown/g' "$file"
        
        # Substituir sudo mkdir por echo "$PASSWD" | sudo -S mkdir
        sed -i 's/sudo mkdir/echo "$PASSWD" | sudo -S mkdir/g' "$file"
        
        # Substituir sudo tee por echo "$PASSWD" | sudo -S tee
        sed -i 's/sudo tee/echo "$PASSWD" | sudo -S tee/g' "$file"
        
        # Adicionar unset PASSWD no final do arquivo se não existir
        if ! grep -q "unset PASSWD" "$file"; then
            echo "" >> "$file"
            echo "unset PASSWD" >> "$file"
        fi
        
        echo "✅ $file corrigido"
    else
        echo "⚠️  $file não encontrado"
    fi
done

echo "Correção concluída!"
