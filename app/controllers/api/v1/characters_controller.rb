class Api::V1::CharactersController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]
    def index
      @characters = Character.all
      render json: @characters
    end
  
    def show
      if @character
        @character = Character.find(params[:id])
        render json: @character
      else
        render json: {error: 'Unable to find character'}, status: 400
      end

    end
  
    def new
      @character = Character.new
    end
  
    def create
      @character = Character.new(character_params)
  
      if @character.save
        render json: @character
      else
        render json: {error: 'Unable to create character'}, status: 400
      end
    end
  
    def edit
      @character = Character.find(params[:id])
      render json: @character
    end
  
    def update
      @character = Character.find(params[:id])
      render json: {error: 'Character seccessfully updated.'}, status: 200
  
      if @character.update(character_params)
        render json: @character
      else
        render json: {error: 'Unable to update Character'}, status: 400
      end
    end
  
    def destroy
        if @character
            @character = Character.find(params[:id])
            @character.destroy
            render json: {error: 'Character seccessfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete Character'}, status: 400
        end
    end
  
    private
      def character_params
        params.require(:character).permit(:name, :gender, :birthdate, :height, :weight,
        :home_location )
      end
end
