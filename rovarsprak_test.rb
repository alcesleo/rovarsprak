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
