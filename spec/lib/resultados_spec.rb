require 'rails_helper'
require 'resultados'

RSpec.describe Resultados, type: :lib do
  describe "Calcula performance" do
    it "with valid attributes" do
      resultado = Resultados.new(10, 20)

      expect(resultado.calcula_performance).to eq(2.0)
    end

    it "with a valid valor realizado and meta equals to zero" do
      resultado = Resultados.new(0, 20)

      expect(resultado.calcula_performance).to eq(0)
    end

    it "with valid valor realizado valido and valor meta nil" do
      resultado = Resultados.new(nil, 20)

      expect(resultado.calcula_performance).to eq(0.0)
    end

    it "with valid valor realizado as nil and valid valor meta" do
      resultado = Resultados.new(20, nil)

      expect(resultado.calcula_performance).to eq(0.0)
    end

    it "with a valid valor meta and a valor realizado as zero" do
      resultado = Resultados.new(10, 0)

      expect(resultado.calcula_performance).to eq(0)
    end
  end

  describe "Calculate valor realizado" do
    it "with a valid valor realizado and a valid valor meta" do
      resultado = Resultados.new(1.0,2.0)

      expect(resultado.calcula_realizado).to eq(2.0)
    end

    it "with a valid valor realizado and a valor meta as zero" do
      resultado = Resultados.new(0,2.0)

      expect(resultado.calcula_realizado).to eq(0)
    end

    it "with a valid valor realizado as zero and a valid valor meta" do
      resultado = Resultados.new(1.0,0)

      expect(resultado.calcula_realizado).to eq(0)
    end

    it "with a valid valor realizado as nil and a valid valor meta" do
      resultado = Resultados.new(1.0,nil)

      expect(resultado.calcula_realizado).to eq(0)
    end

    it "with a invalid valor realizado and a valor meta as zero" do
      resultado = Resultados.new(1.0,"a")

      expect { resultado.calcula_realizado }.to raise_error("String can't be coerced into Float")
    end
  end
end
