require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should have_many :songs }

  describe 'instance methods' do
    describe '#average_song_length' do
      before(:each) do
        @prince = Artist.create!(name: "Prince")
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 854, play_count: 1235)
        @beret = @prince.songs.create!(title: 'Rapsberry Beret', length: 233, play_count: 12312)
        @other_song = @prince.songs.create!(title: 'Other Song', length: 250, play_count: 554)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(445.67)  
      end
    end
  end
end