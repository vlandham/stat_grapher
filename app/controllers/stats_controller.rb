class StatsController < ApplicationController
  # GET /stats
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /maps/1
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def import
    manager = PageManager.new
    
    if !params || !params[:dump] || !params[:dump][:file]
      flash[:notice] = "We need a Stats File Stat!"
      redirect_to stats_url
      return
    end
    
    params[:dump][:file].each { |line|
        
        parts = line.split(';')
        if parts[1] =~ /CLST/
            manager.add( parts[3], parts[2], parts[0] ) if parts[3] && !parts[3].empty?
        end
    }
    @page_number = params[:dump][:page_number].to_i || 25
    
    @pages = manager.sorted_pages[0, @page_number]

    respond_to do |format|
      format.html
    end
  end
end
