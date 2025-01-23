# Guia de Ferramentas de Cybersegurança Baseadas em OSINT

Este documento detalha conceitos e práticas relacionados a ferramentas de OSINT (Open Source Intelligence), conforme as etapas apresentadas no material de referência. Inclui explicações conceituais e exemplos práticos de aplicação.

---

## O que é OSINT?
OSINT (Open Source Intelligence) refere-se à coleta de informações disponíveis publicamente em diversas fontes. Essas informações podem ser usadas para:
- Identificar vulnerabilidades.
- Mapear serviços.
- Analisar metadados.
- Monitorar ameaças.

As principais fontes incluem:
- Blogs, fóruns e mídias sociais.
- Mídias tradicionais.
- Registros governamentais.

**Exemplo prático:**
Usar fóruns públicos para identificar discussões sobre brechas de segurança recentes em softwares corporativos.

---

## Ferramentas OSINT

### 1. **Google Hacking**
O Google Hacking é o uso de operadores de pesquisa (dorks) para encontrar informações específicas.

**Principais operadores:**
- `site:` busca dentro de um site específico. Ex.: `site:exemplo.com.br`
- `intitle:` busca por títulos de páginas. Ex.: `intitle:"login"
- `filetype:` busca por tipos de arquivos. Ex.: `filetype:pdf`

**Exemplo prático:**
Para encontrar documentos confidenciais expostos, execute no Google:
```
filetype:xlsx "confidencial"
```
Isso retorna planilhas Excel que contêm a palavra "confidencial".

---

### 2. **Shodan**
Conhecido como o "Google dos Hackers", o Shodan é usado para encontrar dispositivos conectados à internet.

**Funcionalidades principais:**
- Busca por dispositivos com vulnerabilidades.
- Filtragem por localização, tipo de dispositivo e portas abertas.

**Exemplo prático:**
Buscar câmeras de segurança expostas na cidade de São Paulo:
```
country:BR city:"São Paulo" product:"webcam"
```
---

### 3. **Maltego**
Uma ferramenta poderosa para o reconhecimento de informações pessoais e organizacionais. Oferece uma interface gráfica (GUI) para visualização de relações entre dados.

**O que pode ser coletado:**
- Informações pessoais (nomes, e-mails).
- Infraestrutura de rede (endereços IP, domínios).

**Exemplo prático:**
Usar o Maltego para mapear as conexões de redes sociais de um indivíduo em uma investigação de recursos humanos.

---

### 4. **FOCA**
FOCA (Fingerprinting Organizations with Collected Archives) é uma ferramenta especializada em coleta de metadados de arquivos.

**Metadados coletados incluem:**
- Nome de usuários.
- Versão de softwares.
- Diretórios e caminhos de rede.

**Exemplo prático:**
Fazer upload de um documento PDF e extrair o histórico de edições para identificar o autor e as ferramentas usadas.

---

## Benefícios e Limitações do OSINT

### Benefícios:
- Redução de custos com coleta de informações.
- Camada extra de segurança ao identificar vulnerabilidades públicas.
- Dados sempre atualizados e acessíveis.

### Limitações:
- Alto volume de dados irrelevantes.
- Exige habilidades analíticas e conhecimentos de ferramentas.
- Trabalhos manuais sem automação podem ser demorados.

---

## Conclusão
O OSINT é um "canivete suíço" da segurança cibernética. Seu uso eficaz requer o conhecimento de ferramentas como Google Hacking, Shodan, Maltego e FOCA, bem como habilidades analíticas para interpretar os dados coletados. Ao dominar essas técnicas, é possível fortalecer a segurança de sistemas e tomar decisões informadas em ambientes corporativos e pessoais.

