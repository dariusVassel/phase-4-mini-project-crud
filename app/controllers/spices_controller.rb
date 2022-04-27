class SpicesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        spice = Spice.all
        render json: spice, status: :ok
    end

    # def show
    #     spice = find_by_id
    #     render json: spice, status: :ok
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_by_id
        spice.update(spice_params)
        render json: spice, status: :created
    end

    def destroy
        spice = find_by_id
        spice.destroy
        render json: {}
    end

    private
    def find_by_id
        Spice.find_by(id: params[:id])
    end

    def render_not_found_response
        render json: {error: "Spice no found"}, status: :not_found
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
