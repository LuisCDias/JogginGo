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
    print "--------------------------------------------------------\n"
    print "--------------------------------------------------------\n"
    print "--------------------------------------------------------\n"
    print "--------------------------------------------------------\n"
    print "--------------------------------------------------------\n"
    puts params["initial_time"]
    
    initial_time = params[:initial_time]
    m=initial_time.split(":")
    year = m[0].to_i
    month = m[1].to_i
    day = m[2].to_i
    hour = m[3].to_i
    minute = m[4].to_i
    second = m[5].to_i
    mil = m[6].to_i

    initial = Time.local(year,month,day,hour,minute,second,mil)


    final_time = params[:final_time]
    m1=final_time.split(":")
    year = m1[0].to_i
    month = m1[1].to_i
    day = m1[2].to_i
    hour = m1[3].to_i
    minute = m1[4].to_i
    second = m1[5].to_i
    mil = m1[6].to_i
    
    final = Time.local(year,month,day,hour,minute,second,mil)

    delta = final-initial

    c = Time.at(delta).gmtime.strftime('%R:%S:%L')

    @track = Track.new(name:params["name"], city:params["city"], 
      country: params["country"], user_id:params["user_id"],
      private: params["private"], approved: params["approved"])
    @user = User.find(params["user_id"])

    @track.points.build(params["points"])
    @track.timings.build(initial_time:initial,final_time:final, global_time:
      c)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @user, notice: 'Track was successfully created.' }
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