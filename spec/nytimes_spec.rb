require 'pry'
require './lib/nytimes'

RSpec.describe Nytimes do

  before :all do
    @hash = Nytimes::DATA
  end

  it 'test it can get copyright' do
    #Set your code to the local variable, "result"
    result = @hash[:copyright]

    expect(result).to eq "Copyright (c) 2018 The New York Times Company. All Rights Reserved."
  end

  it 'test it can get array of stories' do
    #Set your code to the local variable, "result"

    result = @hash[:results]
    
    expect(result).to be_an Array
    expect(result.count).to eq 44
  end

  it 'test it can get all stories with subsection of politics' do
    #Set your code to the local variable, "result"

    stories = @hash[:results]
    result = stories.find_all do |story|
      story[:subsection] == 'Politics'
    end
    
    expect(result).to be_an Array
    expect(result.count).to eq 6
    expect(result.first[:title]).to eq "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight"
    expect(result.last[:title]).to eq "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down."
  end

end
