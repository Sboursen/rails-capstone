require 'rails_helper'

RSpec.describe Expense, type: :model do
  before { @user = User.create!(name: 'Kaladin', email: 'kaladin@roshar.cos', password: '0123456789') }
  subject { Expense.new(name: 'Lunch', amount: 12, author: @user) }

  describe 'expense' do
    it 'should save when all parameters are valid' do
      subject.save
      expect(Expense.first.name).to eq('Lunch')
    end
  end

  describe 'name' do
    it 'should be non empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a max length of 250' do
      subject.name = 251.times.reduce('') { |t, _i| t + '9' }
      expect(subject).to_not be_valid
    end
  end

  describe 'amount' do
    it 'should be non empty' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should be a number' do
      subject.amount = '10.3f'
      expect(subject).to_not be_valid
    end

    it 'should be non zero' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
  end

  describe 'author' do
    it 'should be non empty' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end
end
