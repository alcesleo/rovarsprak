require 'minitest/autorun'
require './rovarsprak'

describe RovarSprak do
  it 'translates to rövarspråk' do
    RovarSprak.to('ronja rövardotter').must_equal 'rorononjoja rorövovarordodotottoteror'
  end

  it 'translates from rövarspråk' do
    RovarSprak.from('rorononjoja rorövovarordodotottoteror').must_equal 'ronja rövardotter'
  end
end

describe CLI do

  describe 'to' do
    let(:input) { %w( to ronja rövardotter ) }
    subject { CLI.new(input) }

    it 'has the text' do
      subject.text.must_equal 'ronja rövardotter'
    end

    it 'has the direction to' do
      subject.direction.must_equal 'to'
    end

    it 'has the correct output' do
      subject.output.must_equal 'rorononjoja rorövovarordodotottoteror'
    end
  end

  describe 'from' do
    let(:input) { %w( from rorononjoja rorövovarordodotottoteror ) }
    subject { CLI.new(input) }

    it 'has the direction from' do
      subject.direction.must_equal 'from'
    end

    it 'has the correct output' do
      subject.output.must_equal 'ronja rövardotter'
    end

  end

  it 'it throws on invalid translation direction' do
    -> { CLI.new(%w{wrong ronja rövardotter}).direction }.must_raise RuntimeError
  end

end
