class Resultados
  attr_accessor :valor_meta, :valor_realizado

  def initialize(valor_meta, valor_realizado)
    @valor_meta = valor_meta
    @valor_realizado = valor_realizado
  end

  def calcula_performance
    return 0 if valor_realizado.nil?
    return 0 if valor_meta.nil? || valor_meta.zero?
    valor_realizado / valor_meta
  end

  def calcula_realizado
    return 0 if valor_meta.nil? || valor_realizado.nil?
    valor_meta * valor_realizado
  end
end
