require 'json'
class TracksController < ApplicationController
    before_filter :authorize, only: [:show, :edit, :update, :index, :new]
  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracks }
      format.xml { render xml: @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.json
  def new
    @track = Track.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track }
    end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
  end

  # POST /tracks
  # POST /tracks.json
  def create
    #@track = Track.new(params[:track])
    received_track = json_parser(params[:track])

    #points = received_track["points"]
    #raise received_track["points"].inspect
    #pont = points.to_s

    #raise pont.inspect

    #objArray = JSON.parse(pont)
    #raise objArray.inspect

    #puts "-----------------------------------!-----------------------"
    #objArray.each do |item|
    #  puts item
    #end
    #parsed_array = json_array_parser(received_track["points"])
    
    @track = Track.new(name:received_track["name"], city:received_track["city"], 
      country: received_track["country"], user_id:received_track["user_id"],
      private: received_track["private"], approved: received_track["approved"])
    @track.points.build(received_track["points"])


    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render json: @track, status: :created, location: @track }
      else
        format.html { render action: "new" }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.json
  def update
    @track = Track.find(params[:id])

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content }
    end
  end
end