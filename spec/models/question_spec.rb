require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'validation tests' do
    it 'ensures user presence' do
      question = Question.create(question: 'abc',answer: 'sasas').save
      expect(question).to eq(false)
    end
    it 'ensures answer presence' do
      question = Question.create(question: 'abc').save
      expect(question).to eq(false)
    end
    it 'ensures question presence' do
      question = Question.create(answer: 'abc').save
      expect(question).to eq(false)
    end
  end
  
end
