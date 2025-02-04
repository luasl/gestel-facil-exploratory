class TermsController < ApplicationController
before_action :set_contract, only: %i[new create]
before_action :set_term, only: %i[edit update]

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    @term.contract_id = @contract.id
    if @term.save
      redirect_to @contract, notice: "Vigência #{@term.date_start.strftime("%d/%m/%Y")} -
      #{@term.date_end.strftime("%d/%m/%Y")} adicionada ao contrato nº #{@term.contract.number}."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @term.update(term_params)
      redirect_to contract_path(@term.contract_id), notice: "Vigência #{@term.date_start.strftime("%d/%m/%Y")} -
      #{@term.date_end.strftime("%d/%m/%Y")} do contrato nº #{@term.contract.number} atualizada com sucesso."
    else
      render :edit
    end
  end

  private

  def term_params
    params.require(:term).permit(:date_start, :date_end, :number)
  end

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end

  def set_term
    @term = Term.find(params[:id])
  end
end
