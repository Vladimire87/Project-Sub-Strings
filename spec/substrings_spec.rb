# frozen_string_literal: true

require_relative '../substrings'

RSpec.describe '#substrings' do
  let(:dictionary) do
    %w[below down go going horn how howdy it i low own part partner sit]
  end

  it 'should return a hash listing each substring and its count' do
    expect(substrings('below', dictionary)).to eq({ 'below' => 1, 'low' => 1 })
    expect(substrings("Howdy partner, sit down! How's it going?",
                      dictionary)).to eq({ 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1,
                                           'part' => 1, 'partner' => 1, 'sit' => 1 })
  end

  it 'should handle case insensitivity' do
    expect(substrings('BELOW', dictionary)).to eq({ 'below' => 1, 'low' => 1 })
  end

  it 'should handle empty input string' do
    expect(substrings('', dictionary)).to eq({})
  end

  it 'should handle empty dictionary' do
    expect(substrings("Howdy partner, sit down! How's it going?", [])).to eq({})
  end

  it 'should handle input string with no matches in dictionary' do
    expect(substrings('foo bar baz', dictionary)).to eq({})
  end

  it 'should handle dictionary with duplicates' do
    expect(substrings('below', %w[below below low low])).to eq({ 'below' => 1, 'low' => 1 })
  end
end
