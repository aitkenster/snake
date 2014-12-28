require 'snake'

describe Snake do

  let (:nagini) { Snake.new }

  it 'has a length of 1 when created' do
    expect(nagini.length).to eq(1)
  end

  it 'is alive when created' do 
    expect(nagini.dead?).to be false
  end

  it 'can be killed' do 
    nagini.kill
    expect(nagini.dead?).to be true
  end

  it 'increases in length' do 
    nagini.grow
    expect(nagini.length).to eq(2)
  end
end
