# 🤖 SDR Social Selling Assistant

Sistema completo para SDRs gerenciarem conversas de social selling no Instagram e LinkedIn com assistência de IA.

## ✨ Características

- ✅ **Dashboard de Conversas**: Visualize todas as conversas em um só lugar
- ✅ **Múltiplas Conversas em Paralelo**: Abra várias threads como no Claude
- ✅ **Filtros por Status**: Em Aberto, Agendadas, Perdidas
- ✅ **Métricas em Tempo Real**: Acompanhe performance das conversas
- ✅ **IA Contextual**: Claude sugere próximas mensagens baseado no contexto
- ✅ **Persistência Online**: Dados salvos no Supabase (gratuito)
- ✅ **Link Único**: Não muda quando você atualiza o prompt

## 🌐 Deploy no GitHub Pages (Recomendado)

**Por que fazer isso?**
- ✅ Link permanente para sua equipe
- ✅ Hospedagem gratuita
- ✅ Atualizações fáceis (só dar push)
- ✅ Versionamento automático
- ✅ **Dados preservados no Supabase** (separados do código)

**Setup rápido:**
1. Siga o guia completo em [`GITHUB_SETUP.md`](GITHUB_SETUP.md)
2. Seu site ficará em: `https://seu-usuario.github.io/sdr-assistant/`
3. Para atualizar no futuro: execute `deploy.sh` (Mac/Linux) ou `deploy.bat` (Windows)

**Importante:** Os dados das conversas ficam no Supabase. Você pode atualizar o código à vontade sem perder nada! 🎉

---

## 🚀 Setup Completo (15 minutos)

### 1️⃣ Criar Conta no Supabase (Grátis)

1. Acesse [supabase.com](https://supabase.com)
2. Clique em "Start your project"
3. Crie uma conta (pode usar Google/GitHub)
4. Crie um novo projeto:
   - Nome: `sdr-assistant` (ou qualquer nome)
   - Database Password: Escolha uma senha forte
   - Region: South America (mais próximo)
   - Clique em "Create new project"
5. Aguarde ~2 minutos para o projeto ser criado

### 2️⃣ Criar as Tabelas no Banco de Dados

1. No seu projeto Supabase, vá em **SQL Editor** (menu lateral)
2. Clique em "+ New query"
3. **Cole e execute** este SQL:

```sql
-- Tabela de Agentes (configuração)
CREATE TABLE agents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    prompt TEXT NOT NULL,
    api_key TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de Conversas
CREATE TABLE conversations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_id UUID REFERENCES agents(id) ON DELETE CASCADE,
    lead_name TEXT NOT NULL,
    platform TEXT NOT NULL CHECK (platform IN ('instagram', 'linkedin')),
    profile_url TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'scheduled', 'lost')),
    lost_reason TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de Mensagens
CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID REFERENCES conversations(id) ON DELETE CASCADE,
    role TEXT NOT NULL CHECK (role IN ('lead', 'assistant')),
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX idx_conversations_agent_id ON conversations(agent_id);
CREATE INDEX idx_conversations_status ON conversations(status);
CREATE INDEX idx_messages_conversation_id ON messages(conversation_id);

-- Habilitar Row Level Security (RLS)
ALTER TABLE agents ENABLE ROW LEVEL SECURITY;
ALTER TABLE conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Políticas de acesso (permitir tudo para anon - ajuste conforme necessário)
CREATE POLICY "Enable all for anon users" ON agents FOR ALL USING (true);
CREATE POLICY "Enable all for anon users" ON conversations FOR ALL USING (true);
CREATE POLICY "Enable all for anon users" ON messages FOR ALL USING (true);
```

4. Clique em **Run** (ou Ctrl/Cmd + Enter)
5. Você verá "Success. No rows returned" ✅

### 3️⃣ Obter as Credenciais do Supabase

1. No seu projeto, vá em **Settings** → **API** (menu lateral)
2. Copie e guarde:
   - **Project URL**: `https://xxxxx.supabase.co`
   - **anon/public key**: `eyJhbGc...` (chave longa)

### 4️⃣ Obter API Key da Anthropic

1. Acesse [console.anthropic.com](https://console.anthropic.com)
2. Faça login ou crie uma conta
3. Vá em **API Keys**
4. Clique em "Create Key"
5. Copie a chave (começa com `sk-ant-api03-...`)

### 5️⃣ Configurar o Assistente

1. Abra `admin.html` no navegador
2. Cole as credenciais:
   - **Supabase URL**
   - **Supabase Anon Key**
   - **API Key da Anthropic**
3. Configure o **Prompt Master** (já vem com exemplo)
4. Dê um nome ao assistente (ex: "SDR Assistant GLA")
5. Clique em **"Salvar Configuração"**
6. 🎉 **Copie o link gerado** e compartilhe com sua equipe!

## 📱 Como Usar (Para SDRs)

### Dashboard Principal

1. Abra o link que recebeu
2. Veja todas as conversas e métricas
3. Clique em **"➕ Nova Conversa"** para começar:
   - Nome do Lead
   - Plataforma (Instagram ou LinkedIn)
   - Perfil (@usuario ou URL do LinkedIn)

### Chat Individual

1. Clique em qualquer conversa para abrir
2. Digite o que **o lead respondeu** no Instagram/LinkedIn
3. Claude vai sugerir a **próxima mensagem** para você enviar
4. Continue a conversa até:
   - **✅ Agendar**: Lead aceitou reunião
   - **❌ Marcar Lost**: Não vai dar certo (informe o motivo)

### Filtros

- **Todas**: Veja tudo
- **Em Aberto**: Conversas ativas
- **Agendadas**: Já converteram
- **Perdidas**: Não seguiram em frente

## 💡 Dicas de Uso

### Prompt Master Eficiente

```
Você é um assistente especializado em social selling que ajuda SDRs da [SUA EMPRESA].

Contexto:
- Produto: [DESCREVA SEU PRODUTO/SERVIÇO]
- Público-alvo: [QUEM VOCÊ ATENDE]
- Proposta de valor: [PRINCIPAL BENEFÍCIO]

Seu papel:
- Analisar as respostas do lead
- Sugerir mensagens curtas e naturais (estilo DM)
- Fazer perguntas que qualifiquem o lead
- Identificar momento certo para agendar

Diretrizes:
- Seja consultivo, não vendedor
- Use linguagem próxima e natural
- Mensagens de 2-3 frases no máximo
- Foque em entender a dor antes de vender
```

### Exemplo de Fluxo

**SDR digita:** "Oi! Sim, trabalho com marketing mas tô travada no crescimento orgânico"

**Claude sugere:** "Entendo! A maioria das pessoas trava nesse ponto. Só pra eu entender melhor - você já testou alguma estratégia específica de conteúdo ou tá começando do zero?"

## 🔒 Segurança e Privacidade

### ⚠️ IMPORTANTE

Esta versão armazena a API Key da Anthropic no **localStorage do navegador**. 

**Para uso profissional:**
- Configure RLS adequado no Supabase
- Considere criar um backend para proteger a API key
- Implemente autenticação de usuários
- Use variáveis de ambiente

### Para Uso Pessoal/Pequena Equipe

✅ **Está OK usar assim** se:
- Você confia nas pessoas que terão acesso
- A equipe é pequena (2-10 pessoas)
- Você monitora o uso da API da Anthropic

## 💰 Custos

### Supabase
- **Gratuito** até 500MB de dados
- **Gratuito** até 2GB de transferência/mês
- Mais que suficiente para pequenas equipes

### Anthropic Claude API
- Claude Sonnet 4.5: ~$3 por milhão de tokens de entrada
- ~$15 por milhão de tokens de saída
- Conversas típicas custam ~$0.01-0.05 cada
- Monitore em [console.anthropic.com](https://console.anthropic.com)

**Estimativa para 100 conversas/mês:** ~$2-5/mês

## 📊 Estrutura das Tabelas

```
agents
├── id (UUID)
├── name (TEXT)
├── prompt (TEXT)
├── api_key (TEXT)
├── created_at (TIMESTAMPTZ)
└── updated_at (TIMESTAMPTZ)

conversations
├── id (UUID)
├── agent_id (UUID) → agents.id
├── lead_name (TEXT)
├── platform (TEXT) - 'instagram' ou 'linkedin'
├── profile_url (TEXT)
├── status (TEXT) - 'open', 'scheduled', 'lost'
├── lost_reason (TEXT)
├── created_at (TIMESTAMPTZ)
└── updated_at (TIMESTAMPTZ)

messages
├── id (UUID)
├── conversation_id (UUID) → conversations.id
├── role (TEXT) - 'lead' ou 'assistant'
├── content (TEXT)
└── created_at (TIMESTAMPTZ)
```

## 🐛 Troubleshooting

### "Erro ao salvar" no admin.html
- ✅ Verifique se executou o SQL no Supabase
- ✅ Confirme que copiou a URL e Key corretas
- ✅ Verifique console do navegador (F12)

### "Erro ao criar conversa"
- ✅ Verifique se o agent_id está correto
- ✅ Confirme que salvou a configuração primeiro

### Claude não responde
- ✅ Verifique se a API Key da Anthropic é válida
- ✅ Confirme que tem créditos na conta Anthropic
- ✅ Veja o console do navegador para erros

### Dados não aparecem
- ✅ Abra o Supabase → Table Editor
- ✅ Verifique se os dados estão sendo salvos
- ✅ Confirme que as políticas RLS estão corretas

## 🚀 Próximos Passos (Melhorias Futuras)

Se você quiser evoluir o sistema:

1. **Backend Seguro**: Criar API Node.js/Python
2. **Autenticação**: Login de usuários individual
3. **Webhooks**: Integração direta com Instagram/LinkedIn
4. **Analytics Avançado**: Dashboards com Recharts
5. **Export de Dados**: Baixar relatórios em CSV
6. **Notificações**: Alertas quando lead responde
7. **Multi-agente**: Diferentes assistentes para diferentes produtos

## 📝 Licença

Use livremente! Adaptado para SDRs de social selling.

## 🤝 Suporte

Problemas? 
1. Verifique o Troubleshooting acima
2. Abra o console do navegador (F12) para ver erros
3. Verifique os logs no Supabase (Logs → Postgres Logs)

---

**Criado para Growth Leaders Academy** 🚀

Boas vendas! 💪
