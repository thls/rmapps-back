module Api::V1
  class CompaniesController < BaseController
    # GET /api/v1/companies
    def index
      render json: @companies.page(params[:page])
    end

    # GET /api/v1/companies/1
    def show
      render json: @company
    end

    # POST /api/v1/companies
    def create
      @company = Company.new(company_params)

      if @company.save
        render json: @company, status: :created
      else
        render json: @company, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/companies/1
    def update
      if @company.update(company_params)
        render json: @company
      else
        render json: @company, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/companies/1
    def destroy
      @company.destroy
    end

    private
    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company)
    end
  end
end
