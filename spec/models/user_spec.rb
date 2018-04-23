require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email presence' do
      user = User.create(name: 'first').save
      expect(user).to eq(false)
    end
    it 'ensures name presence' do
      user = User.create(email: 'sa@gmail.com').save
      expect(user).to eq(false)
    end
    
    it 'should save successfully' do 
      user = User.create(name: 'name', email: 'sample@example.com', password: 'sasasas').save
      expect(user).to eq(true)
    end
  end
  context 'no of users tests' do
    let (:params) { {name: 'First',  email: 'sample@example.com', password: 'sasasas'} }
    before(:each) do
      User.create({name: 'First',  email: 'sample@example.com', password: 'sasasas'}).save
      User.create({name: 'Firsts',  email: 'samplse@example.com', password: 'sasasas'}).save
      User.create({name: 'Firstd',  email: 'sampdle@example.com', password: 'sasasas'}).save
      User.create({name: 'Firstr',  email: 'sapdle@example.com', password: 'sasasas'}).save
      User.create({name: 'Firstw',  email: 'samdle@example.com', password: 'sasasas'}).save
    end

    it 'should return no of  users' do
      expect(User.all.count).to eq(5)
    end

  end
end
