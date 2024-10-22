# RELATÓRIO DE IMPLEMENTAÇÃO DE MEDIDAS DE SEGURANÇA

  - Data: 22/10/2024
  - Empresa: Abstergo Industries
  - Responsável: Ing. Kyska Harrington

## Introdução

Este projeto visa otimizar os custos operacionais de uma empresa farmacêutica utilizando soluções na nuvem da AWS. Dada a natureza sensível do negócio, com a fabricação, armazenamento e distribuição de medicamentos com datas de validade, a segurança e a precisão no gerenciamento de inventário são fundamentais. Para garantir a proteção dos dados e a integridade do sistema, três medidas de segurança foram implementadas utilizando ferramentas da AWS.

## Medidas de Segurança Implementadas

### 1. **Criptografia de Dados no S3**
   - **Ferramenta Utilizada**: Amazon S3
   - **Medida de Segurança**: Implementação da criptografia de dados "em repouso" utilizando criptografia AES-256 gerida pelo Amazon S3. Para dados particularmente sensíveis, como informações sobre lotes e datas de validade dos medicamentos, a criptografia com chaves gerenciadas pelo AWS KMS (Key Management Service) foi ativada.
   - **Benefício**: Garantia de que os dados armazenados no S3 estão protegidos contra acessos não autorizados, mesmo que alguém obtenha acesso direto aos arquivos.

   **Passos**:
   - Ativar a criptografia automática para buckets S3.
   - Configurar KMS para controlar o acesso às chaves de criptografia.

### 2. **Gerenciamento de Acessos com AWS Identity and Access Management (IAM)**
   - **Ferramenta Utilizada**: AWS IAM
   - **Medida de Segurança**: Controle granular de permissões para cada serviço e usuário dentro do ambiente AWS. O princípio de mínimo privilégio foi aplicado, garantindo que usuários e funções Lambda tenham apenas as permissões estritamente necessárias para realizar suas tarefas.
   - **Benefício**: Redução do risco de acesso indevido ou uso incorreto de recursos críticos do sistema, como os dados de inventário e relatórios gerados.

   **Passos**:
   - Criar políticas de IAM personalizadas para cada função e serviço.
   - Implementar roles e políticas que garantam permissões mínimas necessárias para Lambda e Quicksight acessarem S3.

### 3. **Monitoramento e Alertas com AWS CloudWatch e GuardDuty**
   - **Ferramentas Utilizadas**: AWS CloudWatch, AWS GuardDuty
   - **Medida de Segurança**: Implementação de monitoramento em tempo real e alertas automáticos para atividades suspeitas ou anômalas no ambiente AWS. Logs de atividades, como tentativas de acesso não autorizado e ações incomuns em buckets S3, são monitorados e alertas são configurados no CloudWatch para que ações rápidas sejam tomadas.
   - **Benefício**: Identificação proativa de potenciais ameaças à segurança, permitindo uma resposta imediata e redução de possíveis impactos.

   **Passos**:
   - Configurar CloudWatch Logs para monitorar eventos críticos.
   - Ativar GuardDuty para detecção de ameaças e anomalias baseadas em comportamento.

## Conclusão

Estas medidas visam garantir que a empresa farmacêutica possa operar com segurança, mantendo os dados de inventário protegidos, garantindo o cumprimento das regulamentações e a continuidade do negócio de forma eficiente.
