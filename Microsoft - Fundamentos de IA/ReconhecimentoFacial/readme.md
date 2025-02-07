
# 🧠 Projeto: Testes com Azure AI Vision Service – Análise de Imagem 4.0

## 📌 Objetivo
Este projeto tem como objetivo realizar testes práticos com o **Azure AI Vision Service**, utilizando a versão **Análise de Imagem 4.0**. O foco principal é explorar as capacidades de análise de imagens, como:  
- Detecção de objetos  
- Reconhecimento de texto (OCR)  
- Descrição automática de imagens  
- Classificação de conteúdo visual  

---

## 🔧 Pré-requisitos
Antes de começar, certifique-se de ter os seguintes recursos configurados:

- Conta ativa no **Microsoft Azure**  
- Instância do **Azure AI Vision Service** criada  
- Ferramentas de desenvolvimento instaladas (VS Code, Python ou SDKs relevantes)  
- Conhecimento básico em **REST APIs** e **SDKs do Azure**  
- Python 3.x (se optar por testar via scripts)  

---

## 📂 Estrutura do Projeto

```bash
.
├── README.md
├── requirements.txt    # Dependências do projeto
└── scripts             # Scripts para testes
    ├── test_ocr.py     # Script para reconhecimento de texto
    ├── test_objects.py # Script para detecção de objetos
    └── test_tags.py    # Script para análise de tags
```

---

## 🔍 Execução dos Testes

### 3️⃣ Teste de Reconhecimento de Texto (OCR)  

**Objetivo:** Extrair texto de uma imagem com conteúdo textual.  
**Exemplo de Entrada:**  

![Exemplo de entrada para OCR](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Sample-text.png/640px-Sample-text.png)

**Imagem ilustrativa do processo:**  
![Ilustração do OCR usando Azure AI Vision Service](attachment://An_image_illustrating_OCR_functionality_using_Azur.png)

**Script: `test_ocr.py`**

```python
from azure.core.credentials import AzureKeyCredential
from azure.ai.vision import VisionServiceClient, VisionAnalysisOptions, ImageSource

# Configurações do serviço
endpoint = "https://<seu-endpoint>.cognitiveservices.azure.com/"
api_key = "<sua-chave-api>"

client = VisionServiceClient(endpoint, AzureKeyCredential(api_key))

# Carregar a imagem
image_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Sample-text.png/640px-Sample-text.png"
source = ImageSource(url=image_url)

# Configurar a análise
options = VisionAnalysisOptions(features=["read"])
response = client.analyze_image(source, options)

# Exibir o texto detectado
for region in response.read_results:
    for line in region.lines:
        print("Texto detectado:", line.content)
```

**Saída Esperada:**  
```text
Texto detectado: The quick brown fox jumps over the lazy dog.
Texto detectado: 1234567890
```

---

### 4️⃣ Teste de Detecção de Objetos  

**Objetivo:** Detectar e identificar objetos presentes em uma imagem.  
**Exemplo de Entrada:**  

![Imagem de exemplo para detecção de objetos](https://upload.wikimedia.org/wikipedia/commons/9/9a/Sample_objects.jpg)

**Gráfico representando a saída esperada:**  

![Gráfico de detecção de objetos](attachment://detecao_objetos_grafico.png)

**Script: `test_objects.py`**

```python
options = VisionAnalysisOptions(features=["detectObjects"])
response = client.analyze_image(source, options)

for obj in response.detected_objects:
    print(f"Objeto: {obj.name}, Confiança: {obj.confidence:.2f}")
```

**Saída Esperada:**  
```text
Objeto: Cat, Confiança: 0.95
Objeto: Cup, Confiança: 0.87
Objeto: Chair, Confiança: 0.92
```

---

### 5️⃣ Teste de Classificação de Tags  

**Objetivo:** Gerar tags descritivas para uma imagem.  
**Exemplo de Entrada:**  

![Imagem de exemplo para classificação de tags](https://upload.wikimedia.org/wikipedia/commons/4/47/Nature_image.jpg)

**Script: `test_tags.py`**

```python
options = VisionAnalysisOptions(features=["describe"])
response = client.analyze_image(source, options)

for tag in response.description.tags:
    print("Tag:", tag)
```

**Saída Esperada:**  
```text
Tag: nature
Tag: forest
Tag: river
Tag: tree
```

---

## 📊 Resultados Esperados
- **OCR**: Texto detectado com precisão.  
- **Detecção de Objetos**: Lista de objetos encontrados na imagem.  
- **Classificação de Tags**: Tags representando o conteúdo visual.  

---

## 📚 Referências
- [Documentação do Azure AI Vision](https://learn.microsoft.com/pt-br/azure/ai-services/computer-vision/)  
- [SDK para Python](https://pypi.org/project/azure-ai-vision/)  

---
