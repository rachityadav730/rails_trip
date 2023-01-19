class Api::V1::LoginsController < ApplicationController
  before_action :set_login, only: %i[ show update destroy ]

  # GET /logins
  def index
    @logins = Login.all

    p "@logins",@logins

    render json: @logins
  end

  # GET /logins/1
  def show
    render json: @login
  end

  # POST /logins
  def create
    @login = Login.new(login_params)

    if @login.save
      render json: @login, status: :created, location: @login
    else
      render json: @login.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logins/1
  def update
    if @login.update(login_params)
      render json: @login
    else
      render json: @login.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logins/1
  def destroy
    @login.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def login_params
      params.require(:login).permit(:name, :password)
    end
end
