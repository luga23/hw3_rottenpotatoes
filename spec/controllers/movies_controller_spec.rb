require 'spec_helper'

describe MoviesController do

  describe "Creating a new movie" do
    it "should redirect to home page" do
      fake_movie = mock('Movie')
      fake_movie.stub(:title).and_return('Aladdin')
      fake_movie.stub(:rating).and_return('PG')
      fake_movie.stub(:director).and_return('someone')
      
      Movie.stub(:create!).and_return(fake_movie)
      post :create
      response.should redirect_to movies_path
    end
  end
  
  describe "Deleting a movie" do
    it "should grab the id of the movie to be deleted" do
      fake_movie = mock('Movie')
      fake_movie.stub(:title)
      fake_movie.stub(:destroy)
      Movie.should_receive(:find).with("1").and_return(fake_movie)
      delete :destroy, { :id => "1" }
    end
  end
  
  describe "Finding With Same Director" do
  
    it "should be a RESTful route" do
      Movie.stub(:find_with_same_director) # we need to define on the fly this method because the controller "list_by_director" call it (we use "stub" instead of "should_receive" because we don't expect any specific argument when calling the method)
      
      get :list_by_director, {:id => "1" }
      response.should render_template('list_by_director')
    end
    
    context "with director" do
      it "should grab the id of the movie that we want to find similar movies to" do
        Movie.should_receive(:find_with_same_director).with("1") # we define on the fly the method "find_with_same_director" in movie model and pass the argument "1", if the method already exist in the model, it will be overwritten only for testing purposess, we use "should_receive" instead of "stub" because we have an expectation, it means we expect to call the method with "1" as argument
        
        get :list_by_director, {:id => "1" } # make a get request and send the id in query string = 1, note "id" is the identifier defined in routes.rb
      end
    end
    
    context "with no director" do
      it "should raise InvalidDirector error" do
        Movie.stub(:find_with_same_director)
        
        lambda { get :list_by_director }.should raise_error(ActionController::RoutingError)
        # response.should redirect_to movies_path
      end
    end
    
  end
  
end
