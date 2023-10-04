    class DocumentsController < ApplicationController
    
        def show
           @student = Student.find(params[:student_id])
           @document = @student.documents.find(params[:id])
         end
    
            before_action :find_student
    
        def new
           @document = Document.new
           @document.name = params[:student_name]
          @document.description = params[:student_description]
        end

        def edit
            @student = Student.find(params[:student_id])
            @document = @student.documents.find(params[:id])
          end
      
        def create
            @student = Student.find(params[:student_id])
            @document = @student.documents.new(document_params)
    
            if @document.save
                redirect_to student_document_path(@student, @document)
             else
            render 'new'
            end
        end
    
          private
    
            def document_params
               params.require(:document).permit(:name, :description, :adhar_card, :paincard, :image)
            end
      
          private
    
            def find_student
                @student = Student.find(params[:student_id])
            end
    
    end
