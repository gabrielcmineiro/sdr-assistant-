#!/bin/bash

# 🚀 Script de Deploy Rápido
# Execute este script sempre que fizer mudanças no projeto

echo "🚀 SDR Assistant - Deploy Rápido"
echo "================================"
echo ""

# Verificar se há mudanças
if [[ -z $(git status -s) ]]; then
    echo "✅ Nenhuma mudança detectada. Tudo já está atualizado!"
    exit 0
fi

# Mostrar mudanças
echo "📝 Arquivos modificados:"
git status -s
echo ""

# Pedir mensagem de commit
read -p "💬 Descreva as mudanças (ex: 'Atualizar prompt master'): " commit_message

# Se não digitou nada, usar mensagem padrão
if [ -z "$commit_message" ]; then
    commit_message="Atualização $(date '+%Y-%m-%d %H:%M')"
fi

echo ""
echo "⏳ Enviando para GitHub..."

# Git add, commit, push
git add .
git commit -m "$commit_message"
git push

echo ""
echo "✅ Deploy concluído com sucesso!"
echo "🌐 Seu site será atualizado em ~1 minuto"
echo ""
echo "📊 Acesse: https://SEU-USUARIO.github.io/sdr-assistant/"
echo ""
echo "💡 Dica: Pressione Ctrl+Shift+R no navegador para forçar atualização"
