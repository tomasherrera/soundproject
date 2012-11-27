class EventsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create]
	def index
		@events = Event.all
	end
	def new
    @event = Event.new

    	respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @event }
    	end
  	end
		def create
		@event = Event.new(params[:event])
		client = Soundcloud.new(:client_id => '5e75f69e6e9591de61fc8a7a5dd6de11')
		artists = client.get('/users', :q => @event.artist_name,  :streamable => true)
		tracks = client.get('/tracks', :q => artists[1].username, :streamable => true)
		if tracks 
			@event.track_url=tracks[0].permalink_url
		else
			@event.track_url="no provided"
		end
		    respond_to do |format|
		      if @event.save
		        format.html { redirect_to @event, notice: 'Event was successfully created. I cant wait!' }
		        format.json { render json: @post, event: :created, location: @post }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @event.errors, post: :unprocessable_entity }
		      end
		    end
		end

	def show
	    @event = Event.find(params[:id])

    	respond_to do |format|
      	format.html # show.html.erb
      	format.json { render json: @event }
    	end
	end
end
