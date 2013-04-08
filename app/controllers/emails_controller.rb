class EmailsController < ApplicationController
  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_url }
      format.json { head :no_content }
    end
  end
end
