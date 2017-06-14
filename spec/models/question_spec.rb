require 'rails_helper'

RSpec.describe Question, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:question)).to be_valid
    end
    it 'has an invalid factory' do
      expect(build(:invalid_question)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { build(:question) }
    it { should respond_to :content }
    it { should respond_to :answer }
  end
end