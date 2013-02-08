require 'spec_helper'

describe Sandwich do
  it { should validate_presence_of :sandwich_type }
end
