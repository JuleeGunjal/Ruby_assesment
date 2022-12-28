# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
resource 'Users' do
  explanation 'Users resource'
  before do
    @user = create(:user)
    header 'Accept', 'application/json'
    header 'content-type', 'application/x-www-form-urlencoded'
    header 'Authorization', JsonWebToken.encode(@user, payload = nil)
  end

  get '/users' do
    parameter :name, 'name'
    parameter :email, 'email'
    parameter :gender, 'gender'
    parameter :mobile_no, 'mobile_no'
    parameter :password, 'password'
    let(:name) { @user.name }
    let(:email) { @user.email }
    let(:gender) { @user.gender }
    let(:mobile_no) { @user.mobile_no }
    let(:password) { @user.password }

    context '200' do
      example_request 'Getting a list of users' do
        expect(status).to eq(200)
      end
    end
  end

  post '/users' do
    parameter :name, 'name'
    parameter :email, 'email'
    parameter :gender, 'gender'
    parameter :mobile_no, 'mobile_no'
    parameter :password, 'password'
    let(:name) { 'Ria' }
    let(:email) { "rai#{@user.email}" }
    let(:gender) { 'female' }
    let(:mobile_no) { rand(9_999_999_999) }
    let(:password) { 'Josh@123' }
    context '200' do
      example 'Creating user' do
        do_request
        expect(status).to eq(200)
      end
    end
  end

  put '/users/:id' do
    parameter :id, 'id'
    parameter :name, 'name'
    parameter :email, 'email'
    parameter :gender, 'gender'
    parameter :mobile_no, 'mobile_no'
    parameter :password, 'password'
    let(:id) { @user.id }
    let(:name) { 'Ria' }
    let(:email) { "raii#{@user.email}" }
    let(:gender) { 'female' }
    let(:mobile_no) { rand(9_999_999_999) }
    let(:password) { 'Josh@123' }

    context '200' do
      example 'put request on user' do
        do_request
        expect(status).to eq(200)
      end
    end

    context '404' do
      let(:id) { 0 }
      example 'User is not found' do
        do_request
        expect(status).to eq(404)
      end
    end
  end

  delete '/users/:id' do
    parameter :id, 'id'
    let(:id) { @user.id }

    context '200' do
      example 'delete request on user' do
        do_request
        expect(status).to eq(200)
      end
    end

    context '404' do
      let(:id) { 0 }
      example 'User is not found' do
        do_request
        expect(status).to eq(404)
      end
    end
  end
end
