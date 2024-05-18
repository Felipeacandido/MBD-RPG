# MBD-RPG

Cenário: Sistema de Banco de Dados para um RPG Online

Em um mundo de fantasia, habitado por uma variedade de raças, criaturas e heróis, surge a necessidade de um sistema de banco de dados robusto para gerenciar todas as informações vitais para a experiência dos jogadores. Este RPG online permite que os jogadores criem e controlem seus próprios personagens, interajam em um vasto mundo aberto e participem de missões épicas em grupo. Vamos explorar as entidades, atributos e relacionamentos essenciais desse sistema:

1. **Entidade: Jogador**
   - Atributos:
     - ID_Jogador (Chave Primária)
     - Nome
     - Email
     - Senha
     - Data de Registro
     - Nível

2. **Entidade: Personagem**
   - Atributos:
     - ID_Personagem (Chave Primária)
     - Nome
     - Raça
     - Classe
     - Nível
     - Experiência
     - Pontos de Vida
     - Pontos de Mana
     - Localização (Composto: latitude e longitude)

3. **Entidade: Missão**
   - Atributos:
     - ID_Missão (Chave Primária)
     - Nome
     - Descrição
     - Recompensa
     - Nível Mínimo (Derivado)
     - Concluída

4. **Entidade: Grupo**
   - Atributos:
     - ID_Grupo (Chave Primária)
     - Nome
     - Líder (Chave Estrangeira para Jogador)
     - Data de Criação
     - Número de Membros (Derivado)

5. **Entidade: Item**
   - Atributos:
     - ID_Item (Chave Primária)
     - Nome
     - Descrição
     - Tipo
     - Valor
     - Peso

**Relacionamentos:**
- **Jogador (1) : Personagem (N)**
  - Um jogador pode ter vários personagens, mas cada personagem pertence a apenas um jogador.

- **Personagem (1) : Missão (N)**
  - Um personagem pode participar de várias missões, mas cada missão pode ser realizada por vários personagens.

- **Jogador (1) : Grupo (N)**
  - Um jogador pode liderar ou participar de vários grupos, mas cada grupo tem apenas um líder e pode conter vários membros.

- **Personagem (N) : Item (N)**
  - Um personagem pode possuir vários itens e um item pode estar em posse de vários personagens.

Este sistema de banco de dados permite uma gestão eficaz dos jogadores, seus personagens, suas interações com missões e outros jogadores em grupos, bem como o inventário de itens. Através dessas entidades, atributos e relacionamentos, o mundo do RPG é trazido à vida, proporcionando uma experiência imersiva para os jogadores explorarem e desfrutarem.
