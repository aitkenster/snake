require 'vertabrae'

describe 'vertabrae' do

  let(:lumbar){Vertabrae.new(90, 4,1)}

  it 'has a direction when created' do 
    expect(lumbar.direction).to eq(90)
  end

  it 'has a position when created' do
    expect(lumbar.position).to eq({ x_coord: 4, y_coord: 1})
  end 

  it 'can update its position and direction' do 
    lumbar.update_position(180, 5,1)
    expect(lumbar.direction).to eq(180)
    expect(lumbar.position[:x_coord]).to eq(5)
  end
end
