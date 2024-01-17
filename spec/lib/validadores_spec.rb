require 'rails_helper'
require 'validadores'

RSpec.describe Validadores, type: :lib do
  describe "data" do
    it "validate to date format (YYYY-MM-DD)" do
      data = Validadores.data('2019-12-31')

      expect(data).to eq(true)
    end

    it "validate to date format (YYYY-MM)" do
      data = Validadores.data('2019-12')

      expect(data).to eq(false)
    end

    it "validate to date format (DD/MM/YYYY)" do
      data = Validadores.data('31/12/2019')

      expect(data).to eq(false)
    end
  end

  describe "valor" do
    it "validate integer" do
      data = Validadores.valor("1")

      expect(data).to eq(true)
    end

    it "validate decimal" do
      data = Validadores.valor("1.3")

      expect(data).to eq(true)
    end

    it "validate percent" do
      data = Validadores.valor("100%")

      expect(data).to eq(true)
    end

    it "validate fail number" do
      data = Validadores.valor("a")

      expect(data).to eq(false)
    end
  end

  describe "email" do
    it "validate right e-mail format" do
      data = Validadores.email("teste@mail.com")

      expect(data).to eq(true)
    end

    it "validate wrong e-mail format" do
      data = Validadores.email("teste@com")

      expect(data).to eq(false)
    end
  end
end
