def verificar_hashes(lista_hashes):
  
    for hash_comparacao in lista_hashes:
        
        hash_calculado, hash_esperado = hash_comparacao.split(",")
        
        hash_calculado = hash_calculado.strip()
        hash_esperado = hash_esperado.strip()
        
        # TODO: Verifique se o hash calculado é igual ao hash esperado:
        if hash_calculado != hash_esperado:
            print("Inválido")
        else:
            print("Correto")
        
hashes_usuario = input()

lista_hashes = hashes_usuario.split(";")

verificar_hashes(lista_hashes)
