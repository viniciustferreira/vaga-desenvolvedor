require 'rails_helper'
require 'calculos'

RSpec.describe Calculos, type: :lib do
  describe "Calculate performance" do
    it "with valid attributes" do
      valor_performance = Calculos.performance(100.5, 150.5)

      expect(valor_performance).to eq(1.4975124378109452)
    end

    it "with valor meta equal zero" do
      valor_performance = Calculos.performance(0.0, 150.5)

      expect(valor_performance).to eq(0)
    end

    it "com valor realizado valido e meta null" do
      skip("escreva testes para esses casos")
    end

    it "com valor meta valido e realizado zero" do
      skip("escreva testes para esses casos")
    end
  end
end
