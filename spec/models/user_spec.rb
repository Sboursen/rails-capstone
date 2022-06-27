require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Kaladin', email: 'kaladin@roshar.cos', password: '0123456789') }

  describe 'user' do
    it 'should save when all parameters are valid' do
      subject.save
      expect(User.first.name).to eq('Kaladin')
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

  describe 'email' do
    it 'should be non empty' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid email format' do
      subject.email = 'hoid?roshar.cos'
      expect(subject).to_not be_valid
    end
  end

  describe 'password' do
    it 'should be non empty' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should have at last 6 chars' do
      subject.password = '01234'
      expect(subject).to_not be_valid
    end
  end
end
