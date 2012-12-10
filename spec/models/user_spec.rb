require 'spec_helper'
describe User do
	it 'should be invalid without a name' do
	user=User.new
	user.should_not be_valid
	end
end