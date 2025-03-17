# Limpeza Automática de Logs do Sankhya-W

Este repositório contém um **script Bash** para remover logs antigos do **Sankhya-W** no ambiente Linux. Ele pode ser configurado para rodar automaticamente no **crontab**.

## 📄 Sobre o Script

O script **clearlogs.sh**:
- Remove logs antigos baseados na data no nome do arquivo (ex: `server.log.2025-03-11`).
- Mantém os logs recentes (padrão: **30 dias**, mas pode ser alterado).
- Não afeta o arquivo `server.log` atual.
- Pode ser agendado no **crontab** para execução automática.
- **Deve sempre ser executado com o usuário `mgeweb`**.

## 🛠️ Instalação
### 1. Clonar o Repositório
```bash
cd /home/mgeweb/scripts/
git clone https://github.com/magoroot/scripts.git
```

### 2. Dar Permissão de Execução
```bash
chmod +x /home/mgeweb/scripts/seu-repo/clearlogs.sh
```

### 3. Configurar no Crontab
Para rodar **diariamente às 3h da manhã**, execute:
```bash
sudo crontab -e
```
E adicione esta linha:
```bash
0 3 * * * su - mgeweb -c "/home/mgeweb/scripts/seu-repo/clearlogs.sh"
```

Se quiser rodar **no boot do sistema**, adicione:
```bash
@reboot su - mgeweb -c "/home/mgeweb/scripts/seu-repo/clearlogs.sh"
```

## 📂 Estrutura do Repositório
```
scripts/
│── shell-scripts/
│   ├── clearlogs-snk.sh
|   ├── README.md  <-- Documento explicativo dos scripts
├── README.md      <-- Documento geral dos scripts
```

## 🔄 Personalização
Caso queira manter os logs por mais ou menos dias, edite a variável **DAYS_TO_KEEP** dentro do script:
```bash
DAYS_TO_KEEP=30  # Ajuste conforme necessidade
```

## 🚀 Contribuição
Sinta-se à vontade para **abrir um Pull Request** caso tenha melhorias ou sugestões! 

## 🎉 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📌 Observação Importante
- O script **deve ser sempre executado como o usuário `mgeweb`** para evitar problemas de permissão e configurações incorretas.
- É recomendável manter uma pasta dedicada para scripts na **home do usuário `mgeweb`** (`/home/mgeweb/scripts/`).

