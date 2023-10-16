module Api::V1
  class UsersController < BaseController
    # GET /api/v1/users
    def index
      render json: @users.page(params[:page])
    end

    # GET /api/v1/users/1
    def show
      render json: @user
    end

    # POST /api/v1/users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/users/1
    def update
      if @user.update(user_params.except(:password))
        render json: @user
      else
        render json: @user, represent_with: ModelErrorsRepresenter, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/users/1
    def destroy
      @user.destroy!
    end

    private
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:email, :password)
      end
  end
end
