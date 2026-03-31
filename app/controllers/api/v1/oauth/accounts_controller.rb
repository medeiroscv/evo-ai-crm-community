# frozen_string_literal: true

class Api::V1::Oauth::AccountsController < Api::BaseController
  before_action :authenticate_user!

  def index
    # Return accounts available for OAuth authorization
    accounts = if current_user.administrator?
                 Account.all.map do |account|
                   {
                     account_id: account.id,
                     account_name: account.name,
                     dynamic_client_id: DynamicOauthService.generate_dynamic_client_id(account.id)
                   }
                 end
               else
                 []
               end

    success_response(data: accounts, message: 'OAuth accounts retrieved successfully')
  end
end