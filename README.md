 Prescription DSL – Linguagem de Prescrição Médica com Parslet (Ruby)

Este projeto demonstra a criação de uma DSL externa (Domain Specific Language) usando Parslet, uma ferramenta Ruby para construir parsers. A linguagem foi criada para prescrições médicas, com foco em profissionais da saúde que não são programadores, como médicos.
🧠 Objetivo

Permitir que médicos descrevam prescrições em linguagem natural simplificada, como:

prescrever Paracetamol 500mg a cada 6h por 5 dias

O sistema interpreta essa entrada e gera dados estruturados que podem ser usados para controle de estoque, prontuário eletrônico ou impressão de receitas.
🧰 Ferramentas Utilizadas

    Linguagem: Ruby

    Parser: Parslet

    Formato da entrada: DSL externa (texto plano)

    Código: 100% open-source

📦 Instalação

    Clone o repositório:

git clone https://github.com/seu-usuario/prescription-dsl.git
cd prescription-dsl

Instale o interpretador ruby na sua maquina:
https://rubyinstaller.org/

Instale as dependências:

    bundle install

    Edite o arquivo prescriptions.txt com suas prescrições médicas.

▶️ Como executar

ruby exemplo.rb

📝 Exemplo de entrada (arquivo prescriptions.txt)

prescrever Paracetamol 500mg a cada 6h por 5 dias
prescrever Amoxicilina 250mg a cada 8h por 7 dias

✅ Saída esperada

📋 Prescrições Interpretadas:

1. Paracetamol - 500mg
   Intervalo: 6h por 5 dias
   💊 Total de comprimidos: 20

2. Amoxicilina - 250mg
   Intervalo: 8h por 7 dias
   💊 Total de comprimidos: 21

📌 Estrutura do projeto

prescritor_dsl/
├── parser.rb         # Gramática da linguagem (Parslet)
├── transform.rb      # Ações semânticas
├── exemplo.rb        # Execução principal
├── prescriptions.txt # Entradas da DSL
├── Gemfile           # Dependências

⚙️ Ações semânticas

Ao interpretar a entrada, o parser extrai:

    Nome do medicamento

    Dose (em mg)

    Intervalo de repetição (em horas)

    Duração do tratamento (em dias)

E calcula automaticamente:

    Quantidade total de comprimidos, com base em:
    comprimidos = (24 / intervalo_horas) * duracao_dias

🔧 Exemplo de regra com ação semântica (em transform.rb)

rule(
  medicamento: simple(:med),
  dose: simple(:dose),
  intervalo: simple(:intervalo),
  duracao: simple(:duracao)
) do
  comprimidos = (24 / intervalo.to_i) * duracao.to_i
  {
    medicamento: med.to_s.capitalize,
    dose_mg: dose.to_i,
    intervalo_horas: intervalo.to_i,
    duracao_dias: duracao.to_i,
    comprimidos_totais: comprimidos
  }
end

🧪 Três entradas válidas da linguagem (com saída e ações)
a) Entrada

prescrever Ibuprofeno 400mg a cada 8h por 3 dias

b) Saída

Ibuprofeno - 400mg
Intervalo: 8h por 3 dias
💊 Total de comprimidos: 9

c) Ações semânticas envolvidas

    Extração de tokens (medicamento, dose, intervalo, duracao)

d) Ação adicional inserida

Adicionamos uma calculo para saber quantos comprimidos tem que tomar:
Cálculo automático de comprimidos_totais


🧑‍⚕️ Domínio de aplicação

Este sistema foi pensado para médicos, como uma linguagem acessível para registrar prescrições sem a necessidade de programação. Ele pode ser integrado a:

    Prontuários eletrônicos

    Aplicativos móveis de prescrição

    Interfaces de voz para saúde digital

👨‍💻 Autores

    Nome do Aluno 1  Leonardo Duarte da Silva

    Nome do Aluno 2 Cecilia Ricalcati da Silveira

    Nome do Aluno 3 Brenda Brizola de Oliveira
