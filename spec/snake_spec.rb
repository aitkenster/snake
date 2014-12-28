require 'snake'

describe Snake do

  let (:nagini) { Snake.new }

  it 'has 1 vertabrae when created' do
    expect(nagini.vertabrae.length).to eq(1)
  end

  it 'is alive when created' do 
    expect(nagini.dead?).to be false
  end

  it 'can be killed' do 
    nagini.kill
    expect(nagini.dead?).to be true
  end

  it 'increases in length' do 
    nagini.grow(90, 5, 7)
    expect(nagini.vertabrae.length).to eq(2)
  end

  it 'starts off facing north' do 
    expect(nagini.bearing).to eq(0)
  end

   it 'can change direction' do 
    nagini.change_bearing(270)
    expect(nagini.bearing).to eq(270)
  end
end
