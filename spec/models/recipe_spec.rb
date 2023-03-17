require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create!(name: 'recipe', email: 'epal@mail.com', password: 'password')
    @recipe = Recipe.create(name: 'Recipe 1', description: 'Recipe description', user: @user)
  end

  before(:each) { subject.save }

  it 'should have name recipe' do
    expect(subject.name).to eql('Recipe 1')
  end

  it 'should have description' do
    expect(subject.description).to eql('Recipe description')
  end
end
