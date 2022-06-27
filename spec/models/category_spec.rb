require 'rails_helper'

RSpec.describe Category, type: :model do
  before { @user = User.create!(name: 'Lift', email: 'lift@roshar.cos', password: 'awesomeness') }
  subject { Category.new(name: 'Food', icon: 'https://coppermind.com/lift-stealing-food.png', author: @user) }

  describe 'category' do
    it 'should save when all parameters are valid' do
      subject.save
      expect(Category.first.name).to eq('Food')
    end
  end

  describe 'name' do
    it 'should be non empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a max length of 250' do
      subject.name = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end
  end

  describe 'icon' do
    it 'should be non empty' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should have a max length of 500' do
      subject.icon = 501.times.reduce('') { |t, _i| "#{t}9" }
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
