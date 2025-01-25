# Guia de Ferramentas para Ataques do Tipo Man-in-the-Middle (MITM)

## Introdução ao Ataque Man-in-the-Middle
Um ataque Man-in-the-Middle (MITM) é uma técnica onde o invasor intercepta e, possivelmente, manipula a comunicação entre duas partes. Esse tipo de ataque pode ser usado para:

- **Interceptação de dados sensíveis** como credenciais e informações confidenciais.
- **Manipulação de informações enviadas** durante a comunicação.
- **Envio de links maliciosos** para as vítimas.

Os invasores frequentemente fingem ser participantes legítimos, disfarçando-se na conexão para evitar detecção.

---

## Ferramentas Populares para Ataques MITM

### 1. Wireshark
**Wireshark** é uma ferramenta de análise de protocolos de rede utilizada para capturar e inspecionar pacotes de dados em redes TCP/IP. Ela é amplamente usada em ataques MITM para capturar tráfego de rede.

#### Recursos principais:
- **Captura em tempo real**: Registra todo o tráfego de rede de uma conexão.
- **Filtragem de pacotes**: Permite focar em tipos específicos de dados.
- **Análise detalhada**: Mostra o conteúdo dos pacotes capturados.

#### Exemplo prático:
1. Abra o Wireshark e selecione a interface de rede.
2. Comece a captura de pacotes clicando em **Start**.
3. Utilize filtros como `http` ou `ip.addr == <endereço_IP>` para refinar os resultados.
4. Analise os pacotes capturados para identificar dados sensíveis, como logins ou informações não criptografadas.

---

### 2. Ettercap
**Ettercap** é uma ferramenta poderosa projetada especificamente para ataques MITM, oferecendo recursos de sniffing, manipulação de tráfego e análise de rede.

#### Modos de operação:
- **Envenenamento ARP**: Redireciona o tráfego entre hosts na LAN através do atacante.
  - *Full-Duplex*: Comunicação bidirecional.
  - *Half-Duplex*: Comunicação unidirecional.
- **Filtragem por IP ou MAC**: Foco em tráfego de um host ou segmento de rede específico.

#### Exemplo prático:
1. Inicie o Ettercap no modo gráfico ou linha de comando.
2. Use o comando `arp -s` para realizar envenenamento ARP.
3. Capture e manipule os pacotes da vítima interceptados pelo atacante.
4. Combine o Ettercap com plugins para filtrar ou modificar o tráfego em tempo real.

---

### 3. Cain & Abel
**Cain & Abel** é uma ferramenta para recuperação de senhas que também suporta ataques MITM. Ela pode interceptar senhas enviadas em texto simples e realizar ataques de envenenamento ARP.

#### Exemplo prático:
1. Configure o Cain & Abel para escutar o tráfego na sua rede.
2. Ative o modo de envenenamento ARP para redirecionar o tráfego das vítimas.
3. Inspecione os dados capturados para identificar credenciais e outros dados confidenciais.

---

### 4. Bettercap
**Bettercap** é uma alternativa moderna e poderosa ao Ettercap, construída para manipular e monitorar tráfego em redes modernas.

#### Exemplo prático:
1. Inicie o Bettercap com o comando `bettercap -iface <interface_de_rede>`.
2. Ative módulos como:
   - **Sniffer**: Para capturar pacotes.
   - **HTTP Proxy**: Para manipular tráfego HTTP em tempo real.
3. Use comandos como `net.probe` e `arp.spoof` para escanear a rede e iniciar envenenamento ARP.

---

## Conclusão
Ataques MITM são extremamente perigosos devido à sua capacidade de capturar e manipular dados em tempo real. As ferramentas mencionadas, como Wireshark, Ettercap, Cain & Abel e Bettercap, oferecem funcionalidades avançadas para testes de penetração, mas devem ser utilizadas com responsabilidade para evitar consequências legais ou éticas.

### Dicas de Prevenção:
- Use criptografia (HTTPS, TLS) para proteger dados em trânsito.
- Configure redes Wi-Fi com WPA3 e senhas fortes.
- Implemente monitoramento ativo para identificar comportamentos suspeitos na rede.

> **Nota:** Este guia é destinado exclusivamente para fins educacionais e deve ser usado dentro dos limites éticos e legais.

---

## Recursos Adicionais
- [Wireshark Documentation](https://www.wireshark.org/docs/)
- [Ettercap Official Site](https://www.ettercap-project.org/)
- [Bettercap Documentation](https://bettercap.org/)
