# Guia para Criar o Fork LinuxToys-Arch no GitHub

## Passo 1: Criar o Repositório no GitHub

1. **Acesse GitHub.com** e faça login na sua conta
2. **Clique em "New repository"** (botão verde)
3. **Configure o repositório**:
   - **Repository name**: `linuxtoys-arch`
   - **Description**: `LinuxToys optimized exclusively for Arch Linux and derivatives`
   - **Visibility**: Public (recomendado)
   - **NÃO marque** "Add a README file" (já temos um)
   - **NÃO marque** "Add .gitignore" (já temos um)
   - **NÃO marque** "Choose a license" (já temos um)

4. **Clique em "Create repository"**

## Passo 2: Configurar o Repositório Local

Execute os seguintes comandos no terminal:

```bash
# Navegar para o diretório do projeto
cd /home/gerson/linuxtoys

# Adicionar o repositório remoto do seu fork
git remote add origin https://github.com/SEU_USUARIO/linuxtoys-arch.git

# Adicionar o repositório original como upstream
git remote add upstream https://github.com/psygreg/linuxtoys.git

# Verificar os remotes
git remote -v
```

## Passo 3: Fazer Push para o GitHub

```bash
# Fazer push da branch main
git push -u origin main

# Fazer push da branch arch
git push -u origin arch

# Definir a branch main como padrão
git checkout main
```

## Passo 4: Configurar o Repositório no GitHub

1. **Acesse seu repositório** no GitHub
2. **Vá em Settings** → **General**
3. **Configure**:
   - **Default branch**: `main`
   - **Description**: `LinuxToys optimized exclusively for Arch Linux and derivatives`
   - **Website**: Deixe em branco por enquanto
   - **Topics**: Adicione: `arch-linux`, `linuxtoys`, `pacman`, `arch-derivatives`

## Passo 5: Criar a Primeira Release

1. **Vá em "Releases"** no GitHub
2. **Clique em "Create a new release"**
3. **Configure**:
   - **Tag version**: `v1.0.0-arch`
   - **Release title**: `LinuxToys-Arch v1.0.0`
   - **Description**:
     ```
     🎉 First release of LinuxToys-Arch!
     
     ## What's New
     - Optimized exclusively for Arch Linux
     - Fixed sudo issues specific to Arch
     - Simplified codebase without multi-distro overhead
     - All scripts updated for pacman-only usage
     
     ## Supported Distributions
     - Arch Linux
     - EndeavourOS
     - Manjaro
     - CachyOS
     - Garuda Linux
     - ArcoLinux
     
     ## Installation
     ```bash
     git clone https://github.com/SEU_USUARIO/linuxtoys-arch.git
     cd linuxtoys-arch
     ./p3/run.py
     ```
     ```

4. **Clique em "Publish release"**

## Passo 6: Atualizar URLs no Código

Após criar o repositório, você precisará atualizar algumas URLs:

```bash
# Atualizar README.md
sed -i 's/SEU_USUARIO/SEU_USUARIO_REAL/g' README.md

# Atualizar install.sh
sed -i 's/SEU_USUARIO/SEU_USUARIO_REAL/g' install.sh

# Fazer commit das alterações
git add .
git commit -m "Update URLs for GitHub repository"
git push
```

## Passo 7: Configurar Issues e Discussions

1. **Vá em Settings** → **Features**
2. **Habilite**:
   - ✅ Issues
   - ✅ Discussions
   - ✅ Wiki (opcional)

## Passo 8: Criar Templates

### Issue Template
Crie `.github/ISSUE_TEMPLATE/bug_report.md`:
```markdown
---
name: Bug report
about: Create a report to help us improve
title: ''
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**Arch Linux Distribution**
- [ ] Arch Linux
- [ ] EndeavourOS
- [ ] Manjaro
- [ ] CachyOS
- [ ] Garuda Linux
- [ ] ArcoLinux
- [ ] Other: 

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Additional context**
Add any other context about the problem here.
```

## Passo 9: Documentação Adicional

Crie um arquivo `CONTRIBUTING.md` específico para o fork:

```markdown
# Contributing to LinuxToys-Arch

## Guidelines

1. **Arch Linux Only**: All contributions must be compatible with Arch Linux and derivatives
2. **Use pacman**: Package management should use `pacman` only
3. **Test on multiple Arch derivatives**: Test on Arch, EndeavourOS, Manjaro, etc.
4. **Follow Arch best practices**: Use Arch Linux conventions and practices

## Development Setup

```bash
git clone https://github.com/SEU_USUARIO/linuxtoys-arch.git
cd linuxtoys-arch
./p3/run.py
```

## Submitting Changes

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on Arch Linux
5. Submit a pull request
```

## Próximos Passos

1. **Compartilhar**: Divulgar o fork na comunidade Arch Linux
2. **AUR Package**: Criar um pacote AUR para instalação fácil
3. **Documentação**: Expandir a documentação específica do Arch
4. **Comunidade**: Construir uma comunidade de usuários Arch

## Comandos Úteis

```bash
# Sincronizar com upstream (quando necessário)
git fetch upstream
git checkout main
git merge upstream/main

# Criar nova branch para feature
git checkout -b feature/nova-funcionalidade

# Fazer push de nova branch
git push -u origin feature/nova-funcionalidade
```

---

**Parabéns! Seu fork LinuxToys-Arch está pronto para uso!** 🎉
