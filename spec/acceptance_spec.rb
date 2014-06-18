require "rspec/half_full"

describe 'Something Awesome' do
  100.times do |i|
    case i % 10
    when 0
      it "knows the answer is 42s but question is still pending"
    when 1
      it "will be awesome soon" do
        (2+2).should == 5
      end
    else
      it "is already awesome" do
        (2+2).should == 4
      end
    end
  end
end
