require 'spec_helper'

describe 'User' do
  	before do
  	  @user = build(:user)
  	end

    it 'assignes a uid' do
      @user.save!
      expect(@user.uid).not_to be_blank
    end

    it 'doesn\'t send a confirmation email' do
      expect { @user.save! }.not_to change { ActionMailer::Base.deliveries.count }
    end
end
