class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:index, :welcome, :licensing, :show, :training]
  before_action :find_user, only: [:listing, :account]

  def index
    @lists = List.all
  end

  def show
  end


  def new
    @list = current_user.lists.build
  end


  def edit
  end


  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end


    def list_params
      params.require(:list).permit(:title, :description, :difficulty, :picture)
    end

    def find_user
      @lists = List.where(user_id: current_user)
    end
end
