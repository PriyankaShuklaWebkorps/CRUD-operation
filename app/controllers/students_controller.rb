class StudentsController < ApplicationController

        def new
          @student=Student.new
        end
  
       def index
          @students = Student.all
        end
      
       def show
           @student = Student.find(params[:id])
           @student_name = @student.name
           @student_details = "Name: #{@student.name}, Email: #{@student.email}, Password: #{@student.password}"
       end
          
  
       def create
        @student = Student.new(student_params)
        if @student.save
          redirect_to students_path
        else 
          render :new
        end
      end
  
        def edit
          @student = Student.find(params[:id])
         end
  
         def update
            @student = Student.find(params[:id])
        
            if @student.update(student_params)
              flash[:notice] = "Student information updated successfully." # Add a flash notice for user feedback
              redirect_to student_path(@student) # Redirect to the student's show page
            else
              render :edit
            end
          end
  
        def destroy
          @student = Student.find(params[:id])
          @student.documents.destroy_all if @student.documents.any?
          @student.destroy
          redirect_to students_path, notice: "Record has been destroyed successfully"
        end
  
        private

        def student_params
          params.require(:student).permit(:name, :email, :password)
        end
  
         
  end
  

