class StatsController < ApplicationController
  before_filter :authenticate_user! #, :except => [:some_action_without_auth]

  # GET /stats
  # GET /stats.json
  def index
    @stat = Stat.new
    @stats = current_user.stats.order("stats.created_at asc") # Should get deleted soon

    @bp = current_user.stats.where(:stat_type => 1).order("stats.created_at asc")
    #@fBp = @bp.find(:first).created_at
    #@lBp = @bp.find(:first, :order => "created_at desc").created_at

    @wbc = current_user.stats.where(:stat_type => 2).order("stats.created_at asc")
    #@fWbc = @wbc.find(:first).created_at
    #@lWbc = @wbc.find(:first, :order => "created_at desc").created_at

    @rbc = current_user.stats.where(:stat_type => 3).order("stats.created_at asc")
    #@fRbc = @rbc.find(:first).created_at
    #@lRbc = @rbc.find(:first, :order => "created_at desc").created_at

    @hemo = current_user.stats.where(:stat_type => 4).order("stats.created_at asc")
    #@fHemo = @hemo.find(:first).created_at
    #@lHemo = @hemo.find(:first, :order => "created_at desc").created_at
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { head :no_content }
    end
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(params[:stat])

    respond_to do |format|
      if @stat.save
        format.html { redirect_to "/stats", notice: 'Stat was successfully added.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "new" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stats/1
  # PUT /stats/1.json
  def update
    #@stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        format.html { redirect_to "/stats", notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
   @stat = Stat.find(params[:id])
   @stat.destroy

   respond_to do |format|
     format.html { redirect_to "/stats" }
     format.json { head :no_content }
   end
 end
 
end
