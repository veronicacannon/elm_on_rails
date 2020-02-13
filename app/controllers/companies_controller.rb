# frozen_string_literal: true

# company controller
class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    redirect_to action: 'new'
  end

  private

  def company_params
    params.require(:company).permit(
      :name, :slug, :phone, :location
    )
  end
end
