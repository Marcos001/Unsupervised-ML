# Tópicos em Inteligência Computacional II - MATE32
## Unsupervised Learn 

### Introdução

* Aprendizado não supervisionado
  * ausência de rótulos nos dados
* Conceitos iniciais e histórico
* Grandes quantidades de dados surgem diariamente
  * Facebook, Twitter, Dados do Governo, etc. 
* Agrupamento 
  * Distância e similaridade
* Indução de hipótesis
  * Overfitting, Underfitting
* Viés Indutivo
  * Tarefas
    * Descritivas - _explorar e descrever um conjunto de dados (não supervisionado)_
    * Preditivas - _encontrar uma hipótese a partir os dados de treinamento para prever novos dados (supervisionado)_ 
* Principais dificuldades:
  * Ausência de rótulo
  * quantos **Grupos** eu devo extrair dos dados ?
  * como eu verifico a similarida entre os dados
  * Eu consegui extrair bons grupos ?
* Requisitos
  * Escalabilidade
    * Muitas intâncias
    * Muitos dados 
  * Tipos de Atributos
    * Categórico 
    * Ordinal
    * Intervalar
    * Binário
  * Formato dos Grupos
    * Esféricos
    * Encadeamento
    * Arbitráriacol
   * Escolha dos parâmentros
     * Métodos são sensíveis aos parâmentros
   * Ruído
   * Agrupamento Incremental
   * Alta Dimensionalidade
   *  Restrições
      * ATM
   * Interpretabilidade
   * Usabilidade
* **Cluster bem separado**
  * _Um cluster é formado por um conjunto de dados de tal forma que qualquer dado está mais próximo de qualquer outro ponto no seu cluster do que de outros clusters._
* **Cluster Baseado em Centróides**
  * _Um cluster é formado por um conjunto de dados de tal forma que qualquer dado está mais próximo do centro do seu cluster do que do centro de qualquer outro cluster._
* **Cluster Contínuo ou Encadeado**
  * _Um cluster é formado por um conjunto de dados de tal forma que qualquer dado está mais próximo a um ou mais dados nesse cluster do que qualquer dado de outro cluster._
* **Custer Baseado em Densidade**
  * _Um cluster é formado por uma região densa de dados, separada de outras regiões de alta densidade por regiões de baixa densidade._
* **Cluster Basedado em Similaridade**
  * _Um cluster é formado por dados similares e clusters diferentes não são similares._
   
