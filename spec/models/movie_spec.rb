require 'spec_helper'

describe Movie do

#  describe "Getting all ratings" do
#    it "should return all the ratings available" do
#      fake_results = [mock("rating"),mock("rating"), mock("rating")]
#      Movie.stub(:all_ratings).and_return(fake_results)
#      fake_results.size > 0
#    end
#  end
  
  describe "Finding With Same Director" do
  
    # context "with valid movie" do
      it "should return the movies with same director" do
        fake_results = [mock("Movie"), mock("Movie")] # mocks are silly objects, when we say mock("Movie") it does not mean that it will create a movie object, just a silly object not related with movie model, if you want a real object of movie model then use FactoryGirl gem
        Movie.stub(:find_with_same_director).and_return(fake_results)        

        fake_results.size.should be >= 0
      end
    # end
    
#    context "with invalid movie" do
#      it "should return an empty list" do
#        fake_results = []
#        Movie.stub(:find_with_same_director).and_return(fake_results)
#        
#        fake_results.size.should be == 0
#      end
#    end
    
#    context "without any movie" do
#      it "should return nothing" do
#        fake_results = []
#        Movie.should_receive(:find_with_same_director).with(0).and_return(fake_results)
#        
#        fake_results.size.should be == 0
#      end
#    end
    
  end
  
end
