require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  let(:valid_attributes) {
    { nome: "AchieveMore" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cliente = Cliente.create! valid_attributes
      get :show, params: {id: cliente.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(1)
      end
    end

    context "when save fails" do
      it "fails on create a new Cliente" do
        allow_any_instance_of(Cliente).to receive(:save).and_return(false)

        expect {
          post :create, params: {cliente: valid_attributes}, session: valid_session
        }.to change(Cliente, :count).by(0)
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { nome: "Test" }
      }

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload

        expect(response).to have_http_status(200)
      end

      it "renders a JSON response with the cliente" do
        cliente = Cliente.create! valid_attributes

        put :update, params: {id: cliente.to_param, cliente: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "when update fails" do
      let(:new_attributes) {
        { nome: "Test" }
      }

      it "fails on update the requested cliente" do
        cliente = Cliente.create! valid_attributes
        allow_any_instance_of(Cliente).to receive(:update).and_return(false)

        put :update, params: {id: cliente.to_param, cliente: new_attributes}, session: valid_session
        cliente.reload

        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cliente" do
      cliente = Cliente.create! valid_attributes
      expect {
        delete :destroy, params: {id: cliente.to_param}, session: valid_session
      }.to change(Cliente, :count).by(-1)
    end
  end
end
