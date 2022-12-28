# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET #index' do
    before do
      get :'/users'
    end
    it 'is expected to assign user instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
  end
  describe 'POST #create' do
    user_params = {
      name: 'piya',
      email: 'piya@gmail.com',
      password: 'Piya@123',
      gender: 'female',
      mobile_no: '9546239056'
    }
    before do
      post :'/users#create', params: user_params
    end

    context 'when params are correct' do
      let(:params) { { user: { name: 'piya' } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:user].name).to eq('piya')
      end
    end

    context 'when params are not correct' do
      let(:params) { { user: { name: '' } } }

      it 'is expected to add errors to name attribute' do
        expect(assigns[:user]).not_to  be(I18n.t('blank').to_s)
      end
    end
  end

  describe 'GET #edit' do
    before do
      get :'/users#edit', params: params
    end

    context 'when user id is valid' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id } }

      it 'is expected to set user instance variable' do
        expect(user.id).to eq(params[:id])
      end
    end
  end
end
