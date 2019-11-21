require 'rails_helper'



describe Query do
 subject { create(:query)}

  
it "check validations" do
  
    expect(:principal).to be_defined
    #expect(query).to_not be_valid
    
 
end
end

