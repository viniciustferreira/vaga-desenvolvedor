require 'rails_helper'
require 'csv'
require 'validadores'
require 'resultados'

include ActionDispatch::TestProcess::FixtureFile

RSpec.describe Validadores, type: :lib do
  describe "Importing files" do
    let(:arquivo_valido) { { file: fixture_file_upload('arquivo_valido.csv', 'text/csv') } }
    let(:arquivo_invalido) { { file: fixture_file_upload('arquivo_invalido.csv', 'text/csv') } }

    context "Valid file" do
      it "validating dates" do
        @file = File.open(arquivo_valido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(3)
      end

      it "salve file on database and calculate total performance" do
        @file = File.open(arquivo_valido[:file])
        values = []

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
          values << Resultados.new(row[:valor_meta].to_f, row[:valor_realizado].to_f).calcula_performance
        end

        expect(values.sum).to eq(2.283333333333333)
      end
    end

    context "invalid file" do
      it "validating dates and not persisting data in case of invalid file" do
        @file = File.open(arquivo_invalido[:file])

        CSV.foreach(@file, {headers: true, header_converters: :symbol, col_sep: ';'}) do |row|
          break unless Validadores.data(row[:periodo])
          cliente = Cliente.create!(nome: row[:cliente])
          cliente.resultado.create!(periodo: row[:periodo], valor_meta: row[:valor_meta], valor_realizado: row[:valor_realizado])
        end

        expect(Cliente.all.size).to eq(2)
      end
    end
  end
end
