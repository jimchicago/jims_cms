class SectionsController < ApplicationController

  # layout 'admin' (this line added by Kevin S, but don't recall when/why)

  before_action :confirm_logged_in
  # before_action :find_pages, :only => [:new, :create, :edit, :update]
  # before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(sections_path)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
       render('new')
       flash[:notice] = "Section NOT created successfully"
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
    @section_count = Section.count + 1
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(section_path(@section))
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section successfully destroyed"
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
