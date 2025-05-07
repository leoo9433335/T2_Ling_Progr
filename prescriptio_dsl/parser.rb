require 'parslet'

class PrescriptionParser < Parslet::Parser
  rule(:space)     { match('\s').repeat(1) }
  rule(:space?)    { space.maybe }

  rule(:word)      { match('[a-zA-Z]').repeat(1) >> space? }
  rule(:med_name)  { word.repeat(1).as(:medicamento) >> space? }
  rule(:number)    { match('[0-9]').repeat(1).as(:numero) >> space? }

  rule(:mg)        { str('mg').as(:unidade) >> space? }
  rule(:h)         { str('h').as(:unidade) >> space? }
  rule(:dias)      { str('dias').as(:unidade) }

  rule(:dose) { match('[0-9]').repeat(1).as(:dose) >> str('mg') >> space }
  rule(:intervalo) { str('a cada') >> space >> match('[0-9]').repeat(1).as(:intervalo) >> str('h') >> space }
  rule(:duracao) { str('por') >> space >> match('[0-9]').repeat(1).as(:duracao) >> space >> str('dias') }
  rule(:prescrever) do
    str('prescrever') >> space >>
    med_name >>
    dose >>
    intervalo >>
    duracao
  end

  rule(:newline) { match('[\n]').repeat(1) }
  rule(:entrada) { (prescrever >> (newline | space).repeat).repeat(1) }

  root :entrada

end

