# Projeto de Testes das Ferramentas de Análise de Imagem 4.0 com AI Vision Service no Microsoft Azure

## Introdução
Este documento descreve os passos para testar as funcionalidades do AI Vision Service no Microsoft Azure, aplicadas à Análise de Imagem 4.0. O objetivo é validar as capacidades de reconhecimento, classificação e análise avançada de imagens.

## Pré-requisitos
Antes de iniciar os testes, certifique-se de ter:

- Uma conta ativa no **Microsoft Azure**.
- O recurso **AI Vision Service** provisionado.
- Um contêiner **Azure Blob Storage** para armazenar imagens.
- Azure CLI instalado e configurado.
- Uma ferramenta de requisição HTTP (Postman, cURL ou similar).
- Conhecimento básico em Python ou C# para integração via SDK.

## Etapas do Projeto

### 1. Configuração do Ambiente
1. **Criar um grupo de recursos**:
   ```sh
   az group create --name MeuGrupoDeRecursos --location eastus
   ```
2. **Criar o AI Vision Service**:
   ```sh
   az cognitiveservices account create \
     --name MeuVisionService \
     --resource-group MeuGrupoDeRecursos \
     --kind ComputerVision \
     --sku S1 \
     --location eastus \
     --yes
   ```
3. **Obter a chave de acesso e o endpoint**:
   ```sh
   az cognitiveservices account keys list --name MeuVisionService --resource-group MeuGrupoDeRecursos
   ```
   Guarde a chave de acesso e o endpoint para uso posterior.

### 2. Upload de Imagens no Azure Blob Storage
1. Criar um contêiner para armazenar imagens:
   ```sh
   az storage container create --name imagens --account-name NomeDaContaStorage
   ```
2. Fazer upload de imagens de teste:
   ```sh
   az storage blob upload --container-name imagens --file caminho/para/imagem.jpg --name imagem.jpg --account-name NomeDaContaStorage
   ```

### 3. Testando o AI Vision Service

#### 3.1 Análise de Imagem (Computer Vision API)

1. Fazer uma requisição para análise de imagem:
   ```sh
   curl -X POST "https://<ENDPOINT>/vision/v3.2/analyze?visualFeatures=Categories,Description,Color" \
        -H "Ocp-Apim-Subscription-Key: <CHAVE_DE_ACESSO>" \
        -H "Content-Type: application/json" \
        --data "{\"url\": \"https://caminho/para/imagem.jpg\"}"
   ```

2. A resposta conterá informações sobre a imagem, incluindo categorias, descrição textual e cores dominantes.

#### 3.2 Reconhecimento de Texto (OCR)

1. Enviar imagem para OCR:
   ```sh
   curl -X POST "https://<ENDPOINT>/vision/v3.2/read/analyze" \
        -H "Ocp-Apim-Subscription-Key: <CHAVE_DE_ACESSO>" \
        -H "Content-Type: application/json" \
        --data "{\"url\": \"https://caminho/para/imagem.jpg\"}"
   ```
2. Obter resultado do OCR:
   ```sh
   curl -X GET "https://<ENDPOINT>/vision/v3.2/read/analyzeResults/<ID_DA_ANALISE>" \
        -H "Ocp-Apim-Subscription-Key: <CHAVE_DE_ACESSO>"
   ```

#### 3.3 Detecção de Objetos

1. Fazer uma requisição para detecção de objetos:
   ```sh
   curl -X POST "https://<ENDPOINT>/vision/v3.2/detect" \
        -H "Ocp-Apim-Subscription-Key: <CHAVE_DE_ACESSO>" \
        -H "Content-Type: application/json" \
        --data "{\"url\": \"https://caminho/para/imagem.jpg\"}"
   ```
2. A resposta conterá uma lista de objetos identificados na imagem.

### 4. Integração com Aplicativos
Se desejar integrar as funcionalidades do AI Vision Service com um aplicativo, utilize os SDKs da Microsoft para Python ou C#.

**Exemplo em Python:**
```python
from azure.cognitiveservices.vision.computervision import ComputerVisionClient
from msrest.authentication import CognitiveServicesCredentials

# Configuração do cliente
client = ComputerVisionClient("<ENDPOINT>", CognitiveServicesCredentials("<CHAVE_DE_ACESSO>"))

# Analisar uma imagem
image_url = "https://caminho/para/imagem.jpg"
analysis = client.analyze_image(image_url, ['Description', 'Tags'])

# Exibir resultado
print("Descrição:", analysis.description.captions[0].text)
```

### 5. Avaliação e Ajustes
Após os testes, avalie a precisão dos resultados e ajuste os parâmetros conforme necessário. Caso os resultados não sejam satisfatórios, considere:

- Melhorar a qualidade das imagens de entrada.
- Ajustar os modelos de análise no Azure.
- Utilizar treinamento customizado com **Custom Vision**.

## Conclusão
Este documento apresenta um roteiro completo para testar e validar as funcionalidades do AI Vision Service no Microsoft Azure. Com esses passos, é possível explorar as capacidades de análise avançada de imagens e integrá-las em soluções inteligentes.

---

**Autor:** Kyska Harrington  
**Data:** 07/02/2025  
**Versão:** 1.0
