equire_relative 'parser'
require_relative 'transform'

parser = PrescriptionParser.new
transform = PrescriptionTransform.new

input = File.read('prescriptions.txt')

begin
  tree = parser.parse(input)
  result = transform.apply(tree)

  puts "\n📋 Prescrições Interpretadas:"
  result.each_with_index do |r, i|
    puts "\n#{i + 1}. #{r[:medicamento]} - #{r[:dose_mg]}mg"
    puts "   Intervalo: #{r[:intervalo_horas]}h por #{r[:duracao_dias]} dias"
    puts "   💊 Total de comprimidos: #{r[:comprimidos_totais]}"
  end
rescue Parslet::ParseFailed => error
  puts "\n❌ Erro de parsing:\n\n"
  puts error.parse_failure_cause.ascii_tree
end