class CommissionsController < ApplicationController
before_action :set_contract, only: %i[new create]

  def new
    @commission = Commission.new
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @commission = Commission.new(commission_params)
    @commission.contract_id = @contract.id
    # @commission.user_id = @user.id
    if @commission.save!
      redirect_to @contract, notice: 'Fiscal vinculado com sucesso.'
    else
      :new
    end
  end

  private

  def commission_params
    params.require(:commission).permit(:contract_id, :user_id)
  end

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end

end