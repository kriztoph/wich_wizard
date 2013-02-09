require 'spec_helper'

describe SandwichOrderIngredient do
  it { should belong_to :sandwich_order }
  it { should belong_to :sandwich_ingredient }
end
