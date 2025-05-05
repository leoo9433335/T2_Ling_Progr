require 'parslet'

class PrescriptionParser < Parslet::Parser
  rule(:space)     { match('\s').repeat(1) }
  rule(:space?)    { space.maybe }

  rule(:word)      { match('[a-zA-Z]').repeat(1) >> space? }
  rule(:med_name)  { word.repeat(1).as(:medicamento) >> space }
  rule(:number)    { match('[0-9]').repeat(1).as(:numero) >> space? }

  rule(:mg)        { str('mg').as(:unidade) >> space }
  rule(:h)         { str('h').as(:unidade) >> space }
  rule(:dias)      { str('dias').as(:unidade) }

  rule(:dose)      { number.as(:dose) >> mg }
  rule(:intervalo) { str('a cada') >> space >> number.as(:intervalo) >> h }
  rule(:duracao)   { str('por') >> space >> number.as(:duracao) >> space >> dias }

  rule(:prescrever) do
    str('prescrever') >> space >>
    med_name >>
    dose >>
    intervalo >>
    duracao
  end

  rule(:entrada) { prescrever.repeat(1) }
  root :entrada
end

