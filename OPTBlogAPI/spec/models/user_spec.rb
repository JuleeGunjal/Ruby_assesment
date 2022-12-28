# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'user validations' do
    context 'credentials' do
      let!(:dummy) { FactoryBot.create(:user) }
      it 'should contain email with specified pattern' do
        expect(dummy.email).to match(EMAIL_REGEX)
      end
      it 'should contain unique email' do
        dummy2 = FactoryBot.create(:user)
        dummy2.email = dummy.email
        dummy2.save
        expect(dummy2.reload.email).not_to be dummy.email
      end
      it 'should contain password with pattern' do
        expect(dummy.password).to match(PASSWORD_REGEX)
      end
    end
    contex 'presence of credentials' do
      it 'should contain email' do
        expect(dummy.errors.full_messages.join(', ')).not_to be(I18n.t('blank').to_s)
      end
      it 'should contain email' do
        dummy.email = nil
        dummy.save
        expect(dummy.errors.full_messages.join(', ')).not_to be(I18n.t('blank').to_s + " , #{I18n.t('invalid')}")
      end
      it 'should contain name' do
        expect(dummy.name).not_to be(I18n.t('blank').to_s)
      end
      it 'should contain gender' do
        expect(dummy.gender).not_to be_blank
      end
    end
  end
end
