class OrganisersController < ApplicationController
  before_action :set_organiser, only: [:show, :edit, :update, :destroy]

  def add_event
    @organiser = Organiser.find(params[:id])
    @event = Event.find(params[:event_id])
    @organiser.events << @event
    redirect_to organisers_url
  end

  def delete_event
    organiser = Organiser.find(params[:id])
    event = organiser.events.find(params[:event_id])
    if event
      organiser.events.delete(event)
    end
    redirect_to organisers_url
  end


  # GET /organisers
  # GET /organisers.json
  # def index
  #   @organisers = Organiser.all
  # end

  def index
    # Initialize the filter settings from the following data:
    # 1. Request params from filter form submission
    # 2. Params persisted in session
    # 3. Filterrific default_settings defined in the Student model
    @filterrific = Filterrific.new(
      Organiser,
      params[:filterrific] || session[:filterrific_organisers]
    )

    # Use `#select_options` as container to provide options to the select inputs
    # in the filterrific form.
    # In this example, the `#options_for_...` methods return arrays that can
    # be passed as options to `f.select`
    @filterrific.select_options = {
      sorted_by: Organiser.options_for_sorted_by,
    }

    # Get an ActiveRecord relation for all students that match the filter settings.
    # You can paginate with will_paginate or kaminari.
    # NOTE: filterrific_find returns an ActiveRecord Relation that can be
    # chained with other scopes to further narrow down the scope of the list,
    # e.g., to apply permissions or to hard coded exclude certain types of records.
    @organisers = Organiser.filterrific_find(@filterrific)   #.page(params[:page])

    # Persist the current filter settings in the session as a plain old Hash.
    session[:filterrific_organisers] = @filterrific.to_hash

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

  # Recover from invalid param sets, e.g., when a filter refers to the
  # database id of a record that doesn’t exist any more.
  # In this case we reset filterrific and discard all filter params.
  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(action: :reset_filterrific, format: :html) and return
  end



  # GET /organisers/1
  # GET /organisers/1.json
  def show
    @events = @organiser.events
  end

  # GET /organisers/new
  def new
    @organiser = Organiser.new
  end

  # GET /organisers/1/edit
  def edit
  end

  # POST /organisers
  # POST /organisers.json
  def create
    @organiser = Organiser.new(organiser_params)

    respond_to do |format|
      if @organiser.save
        format.html { redirect_to @organiser, notice: 'Organiser was successfully created.' }
        format.json { render :show, status: :created, location: @organiser }
      else
        format.html { render :new }
        format.json { render json: @organiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisers/1
  # PATCH/PUT /organisers/1.json
  def update
    respond_to do |format|
      if @organiser.update(organiser_params)
        format.html { redirect_to @organiser, notice: 'Organiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @organiser }
      else
        format.html { render :edit }
        format.json { render json: @organiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisers/1
  # DELETE /organisers/1.json
  def destroy
    @organiser.destroy
    respond_to do |format|
      format.html { redirect_to organisers_url, notice: 'Organiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_organisers] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organiser
      @organiser = Organiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organiser_params
      params.require(:organiser).permit(:name, :surname, :email, :skype, :description, :event_id)
    end
end
