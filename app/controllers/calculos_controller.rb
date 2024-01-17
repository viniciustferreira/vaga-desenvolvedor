require 'calculos'
require 'validadores'

class CalculosController < ApplicationController
  def performance
    if valid_attributes?
      valor_performance = Calculos.performance(retype_params[:valor_meta], retype_params[:valor_realizado])

      render json: { valor_performance: valor_performance }
    else
      render json: { errors: ["valores não numéricos"] }, status: :bad_request
    end
  end

  private

  # o tratamento do tipo tem que ser fora do método, ou seja,
  # o Calculos.performance não precisa validar o tipo dentro dele,
  # ele deve receber o tipo correto.
  def retype_params
    new_params = params
    new_params[:valor_meta] = params[:valor_meta].to_f
    new_params[:valor_realizado] = params[:valor_realizado].to_f

    new_params
  end

  def valid_attributes?
    Validadores.valid_float?(params[:valor_meta]) && Validadores.valid_float?(params[:valor_realizado])
  end
end