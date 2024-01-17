class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_realizado.nil?
    return 0 if valor_meta.nil? || valor_meta.zero?

    (valor_realizado / valor_meta)
  end

  def self.calcula_realizado(valor_meta, valor_realizado)
    return 0 if valor_meta.nil? || valor_realizado.nil?

    valor_meta * valor_realizado
  end
end
