require 'rails_helper'
require 'calculos'

RSpec.describe Calculos, type: :lib do
  describe "calcula_performance" do
    it "with valid attributes" do
      valor_performance = Calculos.performance(100.5, 150.5)

      expect(valor_performance).to eq(1.4975124378109452)
    end

    it "with valor meta equal zero" do
      valor_performance = Calculos.performance(0.0, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "with a valid valor realizado and a nil valor meta" do
      valor_performance = Calculos.performance(nil, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "with valid valor meta and valor realizado as zero" do
      valor_performance = Calculos.performance(150.5, 0.0)

      expect(valor_performance).to eq(0)
    end
  end

  describe "calcula_realizado" do
    it "with a valid valor realizado and a valid valor meta" do
      valor_realizado = Calculos.calcula_realizado(1.0,2.0)

      expect(valor_realizado).to eq(2.0)
    end

    it "with a valid valor realizado and a valor meta as zero" do
      valor_realizado = Calculos.calcula_realizado(0,2.0)

      expect(valor_realizado).to eq(0)
    end

    it "with a valid valor realizado as zero and a valid valor meta" do
      valor_realizado = Calculos.calcula_realizado(1.0,0)

      expect(valor_realizado).to eq(0)
    end

    it "with a valid valor realizado as nil and a valid valor meta" do
      valor_realizado = Calculos.calcula_realizado(1.0, nil)

      expect(valor_realizado).to eq(0)
    end

    it "with a invalid valor realizado and a valid valor meta" do
      expect { Calculos.calcula_realizado(1.0, "a") }.to raise_error("String can't be coerced into Float")
    end
  end
end
