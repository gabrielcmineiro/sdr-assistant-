# 🚀 Setup GitHub + Deploy Automático

## Por que fazer isso?

✅ **Versionamento** - Nunca perde código, pode voltar versões  
✅ **Link permanente** - https://seu-usuario.github.io/sdr-assistant  
✅ **Deploy gratuito** - GitHub Pages hospeda de graça  
✅ **Atualizações fáceis** - Commit → Push → Atualizado  
✅ **Dados seguros** - Ficam no Supabase, separados do código  

---

## 🎯 Setup Completo (10 minutos)

### 1️⃣ Criar Repositório no GitHub

1. Acesse [github.com](https://github.com)
2. Faça login (ou crie conta se não tiver)
3. Clique no **"+"** (canto superior direito) → **"New repository"**
4. Configure:
   - **Repository name:** `sdr-assistant` (ou qualquer nome)
   - **Description:** "SDR Social Selling Assistant com IA"
   - **Public** ✅ (para usar GitHub Pages grátis)
   - **NÃO marque** "Add README" (já temos)
5. Clique em **"Create repository"**

### 2️⃣ Conectar Projeto Local ao GitHub

Abra o terminal na pasta do projeto e execute:

```bash
# Inicializar git (se ainda não fez)
git init

# Adicionar todos os arquivos
git add .

# Primeiro commit
git commit -m "Initial commit - SDR Assistant"

# Conectar ao GitHub (substitua SEU-USUARIO e sdr-assistant pelo seu)
git remote add origin https://github.com/SEU-USUARIO/sdr-assistant.git

# Enviar para o GitHub
git branch -M main
git push -u origin main
```

**Importante:** Substitua `SEU-USUARIO` pelo seu username do GitHub!

### 3️⃣ Ativar GitHub Pages (Hospedagem Grátis)

1. No seu repositório no GitHub, vá em **Settings**
2. No menu lateral, clique em **Pages**
3. Em **Source**, selecione:
   - Branch: **main**
   - Folder: **/ (root)**
4. Clique em **Save**
5. Aguarde ~2 minutos
6. 🎉 Seu site estará em: `https://seu-usuario.github.io/sdr-assistant/`

### 4️⃣ Testar o Deploy

1. Acesse: `https://seu-usuario.github.io/sdr-assistant/`
2. Você verá a landing page (index.html)
3. Configure no admin.html
4. Copie o link do dashboard e compartilhe com a equipe!

---

## 🔄 Como Atualizar o Projeto (Workflow Diário)

### Quando fizer mudanças nos arquivos:

```bash
# Ver o que mudou
git status

# Adicionar mudanças
git add .

# Commitar com mensagem descritiva
git commit -m "Descrição do que você mudou"

# Enviar para GitHub
git push
```

**Pronto!** Em ~1 minuto o site é atualizado automaticamente no GitHub Pages.

### ⚠️ Importante: Dados vs Código

**O que está no GitHub:**
- Arquivos HTML, CSS, JavaScript
- README, documentação
- Código do projeto

**O que NÃO está no GitHub:**
- Configurações pessoais (API keys ficam no localStorage)
- Dados das conversas (ficam no Supabase)
- Histórico de mensagens (ficam no Supabase)

**Resultado:** Você pode atualizar o código quantas vezes quiser - **ZERO impacto nos dados!**

---

## 🎨 Exemplo de Workflow Completo

### Cenário: Você quer mudar o prompt master

```bash
# 1. Edite admin.html localmente
# 2. Teste localmente abrindo no navegador
# 3. Quando estiver OK:

git add admin.html
git commit -m "Atualizar prompt master para focar em qualificação"
git push

# 4. Aguarde 1 minuto
# 5. Suas SDRs já verão a mudança ao abrir o link
```

### Cenário: Melhorar o dashboard

```bash
# 1. Edite dashboard.html
# 2. Teste localmente
# 3. Commit e push

git add dashboard.html
git commit -m "Adicionar contador de conversas por plataforma"
git push
```

---

## 📋 Comandos Git Úteis

```bash
# Ver histórico de commits
git log --oneline

# Voltar para versão anterior (se fez besteira)
git reset --hard COMMIT_ID

# Ver diferenças antes de commitar
git diff

# Ver status atual
git status

# Criar branch para testar features novas
git checkout -b feature-nova-funcao

# Voltar para branch principal
git checkout main
```

---

## 🔒 Segurança das API Keys

**Como funciona:**

1. **Admin configura** no admin.html → Salva no **localStorage do navegador**
2. **SDRs acessam** dashboard.html → Lê do **Supabase** (via agent_id)
3. **GitHub** → Só tem código HTML, **sem keys**

**Importante:**
- As API keys **nunca** vão para o GitHub
- Cada navegador armazena localmente
- Se limpar navegador, precisa reconfigurar

**Para produção futura:**
- Considere backend Node.js/Python
- Armazene keys em variáveis de ambiente
- Implemente autenticação de usuários

---

## 📊 Estrutura do Projeto no GitHub

```
sdr-assistant/
├── .gitignore          # Arquivos que o Git ignora
├── README.md           # Documentação principal
├── GITHUB_SETUP.md     # Este guia
├── index.html          # Landing page
├── admin.html          # Configuração
├── dashboard.html      # Dashboard SDR
└── chat.html           # Chat individual
```

---

## 🐛 Troubleshooting

### "fatal: remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/SEU-USUARIO/sdr-assistant.git
```

### "Permission denied"
Configure SSH ou use HTTPS com token:
```bash
# Gerar token em: GitHub → Settings → Developer settings → Personal access tokens
git remote set-url origin https://TOKEN@github.com/SEU-USUARIO/sdr-assistant.git
```

### Site não atualiza no GitHub Pages
- Aguarde 1-2 minutos após push
- Force refresh: Ctrl+Shift+R (Windows) ou Cmd+Shift+R (Mac)
- Limpe cache do navegador

### Arquivo não atualiza
```bash
# Force o commit
git add -f nome-do-arquivo.html
git commit -m "Force update arquivo"
git push
```

---

## 🎯 Próximos Passos

Após setup:

1. ✅ Configure admin.html com suas credenciais
2. ✅ Teste criando uma conversa
3. ✅ Compartilhe link com 1-2 SDRs para testar
4. ✅ Depois de validado, compartilhe com toda equipe
5. ✅ Monitore uso e custos no console.anthropic.com

---

## 💡 Dicas Pro

**Use branches para testar:**
```bash
git checkout -b teste-novo-recurso
# Faça mudanças e teste
git checkout main  # Voltar se não ficou bom
git merge teste-novo-recurso  # Aplicar se ficou bom
```

**Mantenha commits organizados:**
```bash
# Ruim
git commit -m "mudanças"

# Bom
git commit -m "Adicionar filtro por data no dashboard"
```

**Backup automático:**
- GitHub = Seu backup na nuvem
- A cada push, você tem snapshot completo
- Pode voltar qualquer versão a qualquer momento

---

**Pronto! Agora você tem:**
- ✅ Código versionado no GitHub
- ✅ Site hospedado grátis no GitHub Pages
- ✅ Dados seguros no Supabase
- ✅ Workflow profissional de deploy

🚀 **Boas vendas!**
