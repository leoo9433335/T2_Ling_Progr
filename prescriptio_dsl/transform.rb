require 'parslet'

class PrescriptionTransform < Parslet::Transform
  rule(
    medicamento: simple(:med),
    dose: simple(:dose),
    intervalo: simple(:intervalo),
    duracao: simple(:duracao)
  ) do
    comprimidos = (24 / intervalo.to_i) * duracao.to_i

    {
      medicamento: med.to_s.strip.capitalize,
      dose_mg: dose.to_i,
      intervalo_horas: intervalo.to_i,
      duracao_dias: duracao.to_i,
      comprimidos_totais: comprimidos
    }
  end
end