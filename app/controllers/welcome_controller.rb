class WelcomeController < ApplicationController
  def index
    @display = true
    @message = 'Take a short break from work'
  end

  def show 
    
  end

  def new
    @welcome = Welcome.new
  end
  
    def create
    @welcome = Welcome.new(welcome_params)

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to @welcome, notice: 'welcome was successfully created.' }
        format.json { render :show, status: :created, location: @welcome }
      else
        format.html { render :new }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end


end
