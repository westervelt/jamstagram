require 'rubygems'
require 'uri'
require 'sinatra'

require 'rdio'
require 'rdio_consumer_credentials'

enable :sessions
set :session_secret, 'bmw713'

class HomeController < ApplicationController
  def index
  	
	respond_to do |format|
      format.html # index.html.erb
      format.js
    end
	  	
  end
  
  
  def search
  
  	rdio = Rdio.new([RDIO_CONSUMER_KEY, RDIO_CONSUMER_SECRET])
  	if (params[:query])
  		query = params[:query]
  	else
  		query = 'Wilco'
  	end
  	@results = rdio.call('search', {"types" => "Track", "query" => query, "count" => 8})['result']['results']
  	
  	respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @results}
    end
  
  end
  
  

end

