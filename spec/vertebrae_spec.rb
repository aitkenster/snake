require 'vertabrae'

describe 'vertabrae' do

  let(:lumbar){Vertabrae.new(90, 4,1)}

  it 'has a direction when created' do 
    expect(lumbar.direction).to eq(90)
  end

  it 'has a position when created' do
    expect(lumbar.position).to eq([4,1]) 
  end
end
