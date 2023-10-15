class EquipmentController < ApplicationController
  # GET /equipment
  def index
    render json: @equipment.page(params[:page])
  end

  # GET /equipment/1
  def show
    render json: @equipment
  end

  # POST /equipment
  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: @equipment, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipment/1
  def update
    if @equipment.update(equipment_params)
      render json: @equipment
    else
      render json: @equipment, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
    end
  end

  # DELETE /equipment/1
  def destroy
    @equipment.destroy!
  end

  private
    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment)
    end
end
