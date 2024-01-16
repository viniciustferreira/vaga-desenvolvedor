class Calculos
  def self.performance(valor_meta, valor_realizado)
    return 0 if valor_meta.nil? || valor_meta.zero?

    (valor_realizado / valor_meta)
  end
end
