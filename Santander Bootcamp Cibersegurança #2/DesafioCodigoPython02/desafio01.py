#Crie uma solução para analisar uma lista de e-mails recebidos, verificando padrões comuns de phishing nas mensagens. Se um e-mail contiver palavras suspeitas como "ganhe", "prêmio", "urgente", "desconto", "click" e "promoção" ele deve ser classificado como "Phishing" e "Seguro".

# Função para verificar se o corpo do e-mail contém palavras suspeitas de phishing
def verificar_phishing(mensagem):
    # Lista de palavras que indicam possíveis e-mails de phishing
    palavras_suspeitas = ["ganhe", "prêmio", "urgente", "desconto", "click",  "promoção"]
    
    # Convertendo a mensagem para minúsculas para tornar a verificação case-insensitive
    mensagem = mensagem.lower()
    
    # Verificar se alguma palavra suspeita está presente no corpo do e-mail
    for palavra in palavras_suspeitas:
        if palavra in mensagem:
            return "Phishing"
    
    # Se não encontrar nenhuma palavra suspeita, classificar como "Seguro"
    return "Seguro"
    
email_usuario = input()

email_usuario = email_usuario.strip()

resultado = verificar_phishing(email_usuario)

print(f"Classificação: {resultado}")
