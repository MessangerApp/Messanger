require 'rails_helper'

RSpec.describe Conversation, type: :model do
  context "when valid" do
    it 'creates a new conversation' do
      expect(create(:conversation)).to be_valid
    end
  end

  context "invalid" do
    it 'without name' do
      expect(build(:conversation, name: nil)).to be_invalid
    end
  end
end
