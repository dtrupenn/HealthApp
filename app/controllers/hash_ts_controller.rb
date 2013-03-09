class Hash_tsController < ApplicationController
  before_filter :authenticate_user! #, :except => [:some_action_without_auth]
  
  # POST /hash_t
  # POST /hash_t.json
  def create
    @tag = Hash_t.new(params[:hash_t])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to '/', notice: 'Comment was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  
end