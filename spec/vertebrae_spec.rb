require 'vertabrae'

describe 'vertabrae' do

  it 'has a direction when created' do 
    lumbar = Vertabrae.new(90)
    expect(lumbar.direction).to eq(90)
  end

end
