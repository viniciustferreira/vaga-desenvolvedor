require "calculos"

class Resultados
  attr_accessor :valor_meta, :valor_realizado

  def initialize(valor_meta, valor_realizado)
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
  end

  def calcula_performance
    Calculos.performance(valor_meta, valor_realizado)
  end

  def calcula_realizado
    Calculos.calcula_realizado(valor_meta, valor_realizado)
  end
end
