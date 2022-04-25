class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        new_student = Student.create!({
            name: params[:name], instructor_id: params[:instructor_id], 
            major: params[:major], age: params[:age]
        })
        render json: new_student, status: :created
    end

    def index
        render json: Student.all
    end

    def update
        student = Student.find(params[:id])
        student.update( name: params[:name], instructor_id: params[:instructor_id], 
        major: params[:major], age: params[:age] )
        render json: student, status: :created
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: student, status: :no_content
    end

    private

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end