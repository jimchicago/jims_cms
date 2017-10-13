class SubjectsController < ApplicationController
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form parameters:
    @subject = Subject.find(params[:id])
    # Update the object:
    if @subject.update_attributes(subject_params)
      # If save succeeds, rediret to the show action:
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    # Find a new object using form parameters:
    @subject = Subject.find(params[:id])
  end

  def destroy
  end
  
  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
