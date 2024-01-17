require 'rails_helper'

RSpec.describe CalculosController, type: :controller do
  let(:cliente) {
    create(:cliente)
  }

  let(:valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 10.5, valor_realizado: 12.7 }
  }

  let(:invalid_valid_attributes) {
    { cliente_id: cliente.id, periodo: Date.today, valor_meta: 0.0, valor_realizado: 12.7 }
  }

  let(:valid_session) { {} }

  describe "GET #performance" do
    it "with valid attributes" do
      resultado = Resultado.create! valid_attributes
      get :performance, params: {valor_meta: resultado.valor_meta, valor_realizado: resultado.valor_realizado}, session: valid_session

      expect(response).to be_successful
    end

    it "with invalid atributes" do
      resultado = Resultado.create! valid_attributes
      get :performance, params: {valor_meta: "a", valor_realizado: resultado.valor_realizado}

      expect(response.status).to eq(400)
    end
  end
end
