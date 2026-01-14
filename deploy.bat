@echo off
chcp 65001 > nul
echo 🚀 SDR Assistant - Deploy Rápido
echo ================================
echo.

:: Verificar se há mudanças
git status --short > temp.txt
set /p changes=<temp.txt
del temp.txt

if "%changes%"=="" (
    echo ✅ Nenhuma mudança detectada. Tudo já está atualizado!
    pause
    exit /b 0
)

:: Mostrar mudanças
echo 📝 Arquivos modificados:
git status -s
echo.

:: Pedir mensagem de commit
set /p commit_message="💬 Descreva as mudanças (ex: 'Atualizar prompt master'): "

:: Se não digitou nada, usar mensagem padrão
if "%commit_message%"=="" (
    for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set mydate=%%c-%%b-%%a
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a:%%b
    set commit_message=Atualização %mydate% %mytime%
)

echo.
echo ⏳ Enviando para GitHub...

:: Git add, commit, push
git add .
git commit -m "%commit_message%"
git push

echo.
echo ✅ Deploy concluído com sucesso!
echo 🌐 Seu site será atualizado em ~1 minuto
echo.
echo 📊 Acesse: https://SEU-USUARIO.github.io/sdr-assistant/
echo.
echo 💡 Dica: Pressione Ctrl+Shift+R no navegador para forçar atualização
echo.
pause
