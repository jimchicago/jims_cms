class SubjectsController < ApplicationController
  
  # layout 'admin' (this line added by Kevin S, but don't recall when/why)

  before_action :confirm_logged_in
  # before_action :set_subject_count, :only => [:new, :create, :edit, :update]


  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully!!"
      redirect_to(subjects_path)
    else
      #if save fails, re-display the form so user can fix problem
      @subject_count = Subject.count
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
    @subjects = Subject.sorted
  end

  def update
    # Find a new object using form parameters:
    @subject = Subject.find(params[:id])
    # Update the object:
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the show action:
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
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
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

end
