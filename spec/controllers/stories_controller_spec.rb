require "spec_helper"

describe StoriesController do
  let(:story) { Story.create! owner: "that guy", title: "Look at me", description: "Do it good" }
  before { story.should be_persisted }

  describe "GET index" do
    it "assigns all stories as @stories" do
      get :index
      assigns(:stories).should == [story]
    end
  end

  describe "GET show" do
    it "assigns the requested story as @story" do
      get :show, id: story.id
      assigns(:story).should == story
    end
  end

  describe "GET new" do
    it "assigns a new story as @story" do
      get :new
      assigns(:story).should be_a_new(Story)
    end
  end

  describe "GET edit" do
    it "assigns the requested story as @story" do
      get :edit, id: story.id
      assigns(:story).should == story
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Story" do
        expect {
          post :create, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        }.to change(Story, :count).by(1)
      end

      it "assigns a newly created story as @story" do
        post :create, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        assigns(:story).should be_a(Story)
        assigns(:story).should be_persisted
      end

      it "redirects to the created story" do
        post :create, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        response.should redirect_to(Story.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved story as @story" do
        Story.any_instance.stub(:save).and_return(false)
        post :create, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        assigns(:story).should be_a_new(Story)
      end

      it "re-renders the 'new' template" do
        Story.any_instance.stub(:save).and_return(false)
        post :create, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested story" do
        Story.any_instance.should_receive(:update_attributes).with({these: "params"})
        put :update, id: story.id, story: {these: "params"}
      end

      it "assigns the requested story as @story" do
        put :update, id: story.id, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        assigns(:story).should == story
      end

      it "redirects to the story" do
        put :update, id: story.id, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        response.should redirect_to(story)
      end
    end

    describe "with invalid params" do
      it "assigns the story as @story" do
        Story.any_instance.stub(:save).and_return(false)
        put :update, id: story.id, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        assigns(:story).should == story
      end

      it "re-renders the 'edit' template" do
        Story.any_instance.stub(:save).and_return(false)
        put :update, id: story.id, story: {owner: "this guy", title: "way cool feature", description: "make it awesome"}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested story" do
      expect {
        delete :destroy, id: story.id
      }.to change(Story, :count).by(-1)
    end

    it "redirects to the stories list" do
      delete :destroy, id: story.id
      response.should redirect_to(stories_url)
    end
  end
end
