# ⚡ Início Rápido - 3 Passos

## 📋 Você vai precisar de:

1. Conta gratuita no [Supabase](https://supabase.com)
2. API Key da [Anthropic](https://console.anthropic.com)
3. Conta no [GitHub](https://github.com) (opcional, mas recomendado)

---

## 🎯 OPÇÃO 1: Uso Local (5 minutos)

### Para testar rapidinho:

1. **Configure o Supabase:**
   - Crie projeto no Supabase
   - Execute o SQL (veja README.md seção 2)
   - Copie URL e Key do projeto

2. **Configure o Assistente:**
   - Abra `admin.html` no navegador
   - Cole suas credenciais
   - Clique em "Salvar"

3. **Use!**
   - Copie o link gerado
   - Abra em outra aba para testar
   - Funciona! 🎉

**Limitação:** Link só funciona se você mantiver os arquivos no seu computador.

---

## 🚀 OPÇÃO 2: Deploy no GitHub Pages (15 minutos)

### Para usar de verdade com a equipe:

1. **Configure o Supabase** (igual opção 1)

2. **Suba para o GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/SEU-USUARIO/sdr-assistant.git
   git push -u origin main
   ```

3. **Ative GitHub Pages:**
   - Repositório → Settings → Pages
   - Source: main branch
   - Save

4. **Configure:**
   - Acesse: `https://seu-usuario.github.io/sdr-assistant/admin.html`
   - Configure normalmente
   - Compartilhe o link do dashboard com a equipe!

5. **Para atualizar no futuro:**
   - Windows: Duplo clique em `deploy.bat`
   - Mac/Linux: Execute `./deploy.sh`

**Vantagem:** Link permanente, equipe acessa de qualquer lugar! 🌐

---

## 🔄 Workflow Diário (Após Setup)

### Suas SDRs:

1. Abrem o link do dashboard
2. Clicam "Nova Conversa"
3. Informam nome, plataforma, perfil
4. Digitam o que o lead respondeu
5. Claude sugere próxima mensagem
6. Marcam como Agendada ou Lost

### Você (Admin):

Quer mudar o prompt?
```bash
# 1. Edite admin.html
# 2. Execute:
./deploy.sh  # ou deploy.bat no Windows
# 3. Pronto! Atualizado em 1 minuto
```

**Importante:** Mudanças no código **NÃO afetam** dados das conversas! Tudo seguro no Supabase. ✅

---

## 📊 Estrutura de Arquivos

```
sdr-assistant/
├── index.html          → Landing page
├── admin.html          → Você configura aqui
├── dashboard.html      → SDRs trabalham aqui
├── chat.html           → Chat individual
├── README.md           → Documentação completa
├── GITHUB_SETUP.md     → Guia GitHub Pages
├── deploy.sh           → Script Mac/Linux
├── deploy.bat          → Script Windows
└── .gitignore          → Arquivos que Git ignora
```

---

## ❓ FAQ Rápido

**P: Preciso pagar algo?**
R: Supabase e GitHub Pages são gratuitos. Só paga API da Anthropic (~$2-5/mês para 100 conversas).

**P: Se eu atualizar o código, perco os dados?**
R: **NÃO!** Dados ficam no Supabase (separados). Pode atualizar à vontade.

**P: Link quebra se eu mudar algo?**
R: No GitHub Pages, link é permanente. Localmente, sim.

**P: Quantas pessoas podem usar?**
R: Ilimitado! Supabase gratuito aguenta centenas de usuários.

**P: Funciona mobile?**
R: Sim! Interface responsiva funciona em qualquer dispositivo.

**P: Preciso saber programar?**
R: Não! Só seguir o passo a passo. Tudo pronto.

---

## 🆘 Precisa de Ajuda?

1. **Leia primeiro:** README.md (documentação completa)
2. **Problemas com GitHub:** GITHUB_SETUP.md (seção troubleshooting)
3. **Console do navegador:** Aperte F12 para ver erros
4. **Supabase logs:** Logs → Postgres Logs

---

## 🎯 Próximos Passos

Após tudo funcionando:

1. ✅ Teste com 2-3 SDRs primeiro
2. ✅ Ajuste o prompt master conforme feedback
3. ✅ Libere para toda equipe
4. ✅ Monitore custos em console.anthropic.com
5. ✅ Comemore os resultados! 🎉

---

**Última dica:** Comece simples! Use localmente para testar, depois suba para GitHub quando estiver confiante.

Boas vendas! 🚀
