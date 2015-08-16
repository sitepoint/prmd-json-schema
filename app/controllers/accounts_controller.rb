class AccountsController < ApplicationController

  # GET /accounts
  def show
    account_props = {
      data: {
        id: current_account.id.to_s,
        email: current_account.email
      } 
    }
    render json: account_props
  end

  # POST /accounts
  def create
    id = UUIDTools::UUID.random_create.to_s
    account = Account.new(account_params.merge(id: id))
    if account.save
      issue_token(account)
      issue_refresh_token(account)

      send_account_created(account.email)

      render json: {token: account.jti }, status: :created
    else
      render json: account.errors, status: :unprocessable_entity
    end
  end

  # PUT /account/{id}
  def update
    if current_account.update(account_params)
      issue_token(current_account)
      issue_refresh_token(current_account)

      send_account_changed

      render json: {token: current_account.jti }
    else
      render json: current_account.errors, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end

  def send_account_changed
    ## do send
  end

  def send_account_created(email)
    Rails.logger.info("Calling send_account_created for #{email}")
  end

  def remember_me?
    (params &&
      params.fetch(:account, {}).fetch(:remember_me, false))
  end

  def issue_token(account)
    account.jti = SecureRandom.uuid
  end

  def issue_refresh_token(account)
    return unless remember_me?

    account.refresh_token = SecureRandom.uuid
  end
end
