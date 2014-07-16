class SessionsController < ApplicationController
  before_filter :redirect_logged_in_user, only: [:new]

  def new
    render :new
  end

  def create
    unless params[:email]
      logger.info("no email param: #{params}")
      redirect_to login_url
      return
    end

    # auth user against cloudOs.
    account_name = params[:email].partition('@').first # just the username, no @whateverdomain
    options = {
        :headers => { 'Content-Type' => 'application/json' },
        :body => {
            :name => account_name,
            :password => params[:password]
        }.to_json
    }
    response = HTTParty.post('http://127.0.0.1:3001/api/accounts', options)

    if response.code == 200
      # ensure user exists in our DB
      db_user = User.find_by_email(params[:email])
      unless db_user
        db_user = User.new
        db_user.username = account_name
        db_user.email = params[:email]
        db_user.password = SecureRandom.urlsafe_base64(32) # password does not matter
        db_user.save

        Board.all.each do |board|
          # add user to all boards
          board_member = BoardMember.new
          board_member.member = db_user
          board_member.board = board
          board_member.admin = true
          board_member.save
        end
      end

      session[:session_key] = SecureRandom.urlsafe_base64(32)
      db_user.update_attribute(:session_key, session[:session_key])
      redirect_to root_url

    else
      # TODO: add errors
      logger.info("auth bombed: #{response.code}")

      redirect_to login_url
    end
  end

  def destroy
    current_user.update_attribute(:session_key, nil)
    reset_session
    redirect_to login_url
  end
end
