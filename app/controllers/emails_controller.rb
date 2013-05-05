class EmailsController < ApplicationController
  def show
    @email = Email.where(:get_token => params[:token]).first

    unless @email
      # Honeypot - allow captcha to go through anyway.
      # Limits attack options to brute force only
      if verify_recaptcha
        respond_to do |format|
          format.html
        end
      else
        @email = Email.new
        render 'verify'
        @email = nil
      end

      return
    end

    # Valid email
    if session[:new]
      render 'success'
    elsif verify_recaptcha
      respond_to do |format|
        format.html # show.html.erb
      end
    else
      render 'verify'
    end
    reset_session
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
        session[:new] = true
        format.html { redirect_to :action => 'show', :token => @email.get_token }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @email = Email.where(:delete_token => params[:token]).first
    @email.destroy

    flash[:notice] = "Record deleted."

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
