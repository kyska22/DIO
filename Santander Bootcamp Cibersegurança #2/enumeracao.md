# Ferramentas de Enumeração em Cibersegurança

## O que é Enumeração?
A enumeração é o processo de estabelecer uma conexão ativa com hosts de destino para coletar informações detalhadas que possam ser utilizadas como vetores de ataque. Diferente da varredura, que identifica vulnerabilidades em alto nível, a enumeração visa obter detalhes específicos do sistema invadido, como nomes de máquinas, serviços e configurações.

### Tipos de Informações Enumeradas
- **Rede de origem:** tabelas de roteamento e configurações.
- **Usuários e grupos:** nomes e permissões.
- **Serviços:** aplicações e seus banners.
- **Protocolos:** detalhes de DNS e SNMP.

## Ferramentas para Enumeração
As ferramentas descritas a seguir permitem explorar sistemas, coletar dados e identificar possíveis pontos de exploração.

### 1. **NMap**
O NMap é uma ferramenta de código aberto amplamente utilizada para escaneamento de redes e enumeração de serviços. Ele oferece suporte a diversos scripts para detalhar vulnerabilidades.

#### Comandos Básicos de Enumeração:
```bash
# Escanear todas as portas
nmap -p- <endereco_ip>

# Detectar serviços e versões
nmap -sV <endereco_ip>

# Rodar scripts para enumeração de vulnerabilidades
nmap --script vuln <endereco_ip>
```

#### Exemplo com Scripts NSE (Nmap Scripting Engine):
Os scripts NSE permitem automatizar tarefas comuns.
```bash
# Descobrir vulnerabilidades em servidores HTTP
nmap --script http-vuln-cve2017-5638 -p 80 <endereco_ip>
```

### 2. **NBTScan**
Ferramenta usada para coletar informações de sistemas baseados em NetBIOS, como nomes de máquinas e serviços SMB.

#### Comando:
```bash
# Escanear uma rede
nbtscan <range_de_ip>
```

### 3. **DumpSec**
Software para Windows que coleta dados sobre permissões de arquivos, configurações de grupos e direitos de usuários.

#### Uso:
- Baixe e instale o software.
- Execute-o para listar dados de um servidor remoto usando o protocolo SMB.

### 4. **SMBScanner**
Ferramenta especializada na enumeração de serviços SMB, usada para descobrir informações de compartilhamentos e configurações de sistemas baseados em Windows.

#### Comando:
```bash
# Escanear serviços SMB em um IP
smbscanner <endereco_ip>
```

### 5. **NetCat**
Uma ferramenta extremamente versátil para conexões TCP/UDP e enumeração manual de serviços.

#### Exemplos:
```bash
# Conectar a um serviço para verificar banners
nc <endereco_ip> <porta>

# Escutar conexões em uma porta específica
nc -lvp <porta>
```

## Práticas Recomendadas
- Combine ferramentas para obter informações complementares.
- Use scripts customizados para agilizar a coleta de dados.
- Garanta permissão legal para realizar qualquer teste de enumeração.

## Conclusão
A enumeração é uma etapa essencial em auditorias de segurança e testes de invasão, pois fornece as informações necessárias para planejar explorações. As ferramentas apresentadas, como NMap, NBTScan e NetCat, oferecem uma base robusta para obter informações detalhadas de sistemas e redes.

