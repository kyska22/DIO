# Projeto: Testes de Análise de Sentimentos com Language Studio no Azure AI

## Visão Geral
Este projeto tem como objetivo demonstrar como realizar testes de Análise de Sentimentos utilizando o Language Studio no Azure AI. A análise de sentimentos é um serviço de Processamento de Linguagem Natural (NLP) que identifica a opinião expressa em um texto, classificando-o como positivo, negativo ou neutro.

---
## Pré-requisitos
Antes de iniciar os testes, certifique-se de que possui:
- Uma conta no [Microsoft Azure](https://portal.azure.com/)
- Um recurso do **Azure AI Language** provisionado no Azure
- Acesso ao [Language Studio](https://language.cognitive.azure.com/)

---
## Passos para realizar os testes

### 1. Criar um recurso de Azure AI Language
1. Acesse o [portal do Azure](https://portal.azure.com/)
2. No menu lateral esquerdo, clique em **Criar um recurso**
3. Pesquise por **Azure AI Language** e clique para criar
4. Preencha os campos necessários:
   - Nome do recurso
   - Grupo de recursos
   - Região (ex: Leste dos EUA)
   - Plano de tarifa (S0 para produção ou F0 para testes gratuitos)
5. Clique em **Criar** e aguarde a implantação do recurso

### 2. Acessar o Language Studio
1. No portal do Azure, vá até o recurso do **Azure AI Language** criado
2. No menu lateral, clique em **Language Studio**
3. No painel do Language Studio, selecione **Análise de Sentimentos**

### 3. Realizar testes de análise de sentimentos
1. Escolha a opção **Teste Rápido**
2. Insira um texto para análise
   - Exemplo de entrada:
     ```
     Estou muito feliz com o atendimento ao cliente, foi excelente!
     ```
3. Clique em **Analisar**
4. Verifique a saída gerada
   - Exemplo de saída:
     ```json
     {
       "sentimento": "positivo",
       "confiança": {
         "positivo": 0.98,
         "neutro": 0.01,
         "negativo": 0.01
       }
     }
     ```

### 4. Testando múltiplos textos
O Language Studio permite analisar múltiplos textos de uma vez. Para isso:
1. Vá até a seção **Inserir múltiplos textos**
2. Insira diferentes frases separadas por linha
   - Exemplo de entrada:
     ```
     O serviço foi muito ruim e demorado.
     O produto chegou rápido e em perfeito estado.
     ````
3. Clique em **Analisar**
4. O resultado será uma classificação de sentimento para cada linha enviada.

### 5. Testando com a API do Azure AI Language
Se desejar automatizar a análise, utilize a API REST do Azure AI Language:
1. Copie a chave e o endpoint do seu recurso no portal do Azure
2. Faça uma requisição POST usando **Postman** ou **cURL**
   - Exemplo de requisição:
     ```bash
     curl -X POST "https://<seu-endpoint>/text/analytics/v3.1/sentiment" \
     -H "Ocp-Apim-Subscription-Key: <sua-chave>" \
     -H "Content-Type: application/json" \
     -d '{"documents": [{"id": "1", "text": "Estou muito feliz hoje!"}]}'
     ```
   - Exemplo de resposta JSON:
     ```json
     {
       "documents": [
         {
           "id": "1",
           "sentiment": "positivo",
           "confidenceScores": {
             "positive": 0.95,
             "neutral": 0.03,
             "negative": 0.02
           }
         }
       ]
     }
     ```

---
## Como Utilizar os Resultados
Os resultados da análise de sentimentos podem ser utilizados em diversas aplicações, como:
- Monitoramento de redes sociais
- Feedback de clientes em tempo real
- Classificação automática de e-mails
- Chatbots mais inteligentes

---
## Conclusão
Com o Azure AI Language e o Language Studio, podemos facilmente realizar análises de sentimentos sem necessidade de conhecimento profundo em aprendizado de máquina. Este guia forneceu os passos básicos para realizar testes e consumir a API para automatização. Agora, você pode expandir este projeto integrando a análise de sentimentos em seus aplicativos e serviços!
