# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Authentication' do
  explanation 'Users authentication'
  before do
    @user = create(:user)
    @user.save
    header 'Accept', 'application/json'
    header 'content-type', 'application/x-www-form-urlencoded'
  end

  post '/auth/login_by_email' do
    parameter :email, 'email'
    parameter :password, 'password'
    let(:email) { @user.email }
    let(:password) { @user.password }

    context '401' do
      example_request 'login by email' do
        binding.pry
        #do_request
        response = JSON.parse(response_body)
        expect(status).to eq(401)
      end
    end
  end
end
