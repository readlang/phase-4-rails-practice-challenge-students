class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        new_instructor = Instructor.create!({name: params[:name]})
        render json: new_instructor, status: :created
    end




    def index
        render json: Instructor.all
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(name: params[:name])
        render json: instructor, status: :created
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        render json: instructor, status: :no_content
    end

    private

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end