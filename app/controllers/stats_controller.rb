class StatsController < ApplicationController
  before_filter :authenticate_user! #, :except => [:some_action_without_auth]

  # GET /stats
  # GET /stats.json
  def index
    @stat = Stat.new
    @stats = current_user.stats.order("stats.created_at asc") # Should get deleted soon

    @bps = current_user.stats.where(:stat_type => 1)
    @bp = @bps.order("stats.created_at asc")

    @wbcs = current_user.stats.where(:stat_type => 2)
    @wbc = @wbcs.order("stats.created_at asc")

    @rbcs = current_user.stats.where(:stat_type => 3)
    @rbc = @rbcs.order("stats.created_at asc")

    @hemos = current_user.stats.where(:stat_type => 4)
    @hemo = @hemos.order("stats.created_at asc")

    @hemas = current_user.stats.where(:stat_type => 5)
    @hema = @hemas.order("stats.created_at asc")

    @plats = current_user.stats.where(:stat_type => 6)
    @plat = @plats.order("stats.created_at asc")

    @hrs = current_user.stats.where(:stat_type => 7)
    @hr = @hrs.order("stats.created_at asc")

    @rrs = current_user.stats.where(:stat_type => 8)
    @rr = @rrs.order("stats.created_at asc")

    @temps = current_user.stats.where(:stat_type => 9)
    @temp = @temps.order("stats.created_at asc")

    @sats = current_user.stats.where(:stat_type => 10)
    @sat = @sats.order("stats.created_at asc")

    @pains = current_user.stats.where(:stat_type => 11)
    @pain = @pains.order("stats.created_at asc")

    @weights = current_user.stats.where(:stat_type => 12)
    @weight = @weights.order("stats.created_at asc")

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
