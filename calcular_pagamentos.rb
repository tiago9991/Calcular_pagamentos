module Pagamento
  SIMBOLO_MOEDA = "R$".freeze

  def pagar(valor)  
    puts "Empréstimo de #{SIMBOLO_MOEDA} #{valor} efetuado com sucesso!" 
  end
end

class CalculadoraEmprestimo
  include Pagamento

  def calcular_emprestimo(valor_emprestimo, taxa_juros, numero_parcelas)
    juros = (valor_emprestimo * taxa_juros) / 100
    total_a_pagar = valor_emprestimo + juros
    valor_parcela = total_a_pagar / numero_parcelas
    [total_a_pagar, valor_parcela]
  end

  def obter_dados_emprestimo
    puts "Digite o valor do empréstimo: "
    valor_emprestimo = gets.chomp.to_f

    puts "Digite a taxa de juros (%): "
    taxa_juros = gets.to_f

    puts "Digite o número de parcelas: "
    numero_parcelas = gets.to_i

    [valor_emprestimo, taxa_juros, numero_parcelas]
    
  end

  def realizar_emprestimo

    valor_emprestimo, taxa_juros, numero_parcelas = obter_dados_emprestimo
    total_a_pagar, valor_parcela =  calcular_emprestimo(valor_emprestimo, taxa_juros, numero_parcelas)
  
    puts "Total a ser pago: #{SIMBOLO_MOEDA} #{total_a_pagar}"
    puts "Valor da parcela: #{SIMBOLO_MOEDA} #{valor_parcela}"

    opcao = nil 
    loop do
      puts "Deseja efetuar o pagamento ? (S/N)"
      opcao = gets.chomp.upcase
      break if ["S", "N"].include?(opcao)
      puts "Opção inválida. Por Favor, digite S para sim ou N para não."
    end
  
    if opcao == "S"
      pagar(total_a_pagar)
    else
      puts "Operação cancelada."
    end
  
  end
end

