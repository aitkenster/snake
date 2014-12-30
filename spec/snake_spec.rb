require 'snake'

describe Snake do

  let (:nagini) { Snake.new }
  let (:lumbar) { double :vertabrae, update_position: nil }
  let (:lumbar2) { double :vertabrae, update_position: nil }

  describe 'when created' do

   it 'has 1 vertabrae' do
      expect(nagini.vertabrae.length).to eq(1)
   end

    it'is alive' do 
      expect(nagini.dead?).to be false
    end

    it 'faces north' do 
      expect(nagini.bearing).to eq(0)
    end
  end

  it 'can be killed' do 
    nagini.kill
    expect(nagini.dead?).to be true
  end

  it 'increases in length' do 
    nagini.grow({bearing: 90, x_coord: 5, y_coord: 7})
    expect(nagini.vertabrae.length).to eq(2)
  end

   it 'can change direction' do 
    nagini.change_bearing(270)
    expect(nagini.bearing).to eq(270)
  end

   it 'passes positions and bearings along the snake' do
    nagini.grow({bearing: 0, x_coord: 2, y_coord: 3})
    nagini.vertabrae[0] = lumbar
    nagini.vertabrae[1] = lumbar2
    allow(lumbar).to receive(:get_position).and_return({bearing: 0, x_coord: 3, y_coord: 3})
    allow(lumbar).to receive(:update_position).with(0, 4, 3)
    allow(lumbar2).to receive(:get_position).and_return({bearing: 0, x_coord: 2, y_coord: 3})
    allow(lumbar2).to receive(:update_position).with(0, 3, 3)
    nagini.move(0, 4, 3)
   end

   describe 'moving' do 
  
       before do  
         allow(lumbar).to receive(:get_position).and_return({bearing: 0, x_coord: 3, y_coord: 3})
         nagini.vertabrae[0] = lumbar
       end

       it 'moves west if facing west' do 
         nagini.bearing = 270
         expect(nagini.get_next_move).to eq({bearing: 270, x_coord: 2, y_coord: 3})
       end

       it 'moves east if facing east' do 
         nagini.bearing = 90
         expect(nagini.get_next_move).to eq({bearing: 90, x_coord: 4, y_coord: 3})
       end

       it 'moves north if facing north' do 
         nagini.bearing = 0
         expect(nagini.get_next_move).to eq({bearing: 0, x_coord: 3, y_coord: 4})
       end

       it 'moves south if facing south' do
         nagini.bearing = 180
         expect(nagini.get_next_move).to eq({bearing: 180, x_coord: 3, y_coord: 2})
       end

       it 'grows every 5 moves' do 
        5.times{nagini.move(0, 3, 4)}
        expect(nagini.vertabrae.length).to eq(2)
       end

    end
end
