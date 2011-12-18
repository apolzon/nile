require "spec_helper"

describe UsersController do
  let(:user) { User.create! name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree" }
  before { user.should be_persisted }

  describe "GET index" do
    it "assigns all users as @users" do
      get :index
      assigns(:users).should == [user]
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, id: user.id
      assigns(:user).should == user
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, id: user.id
      assigns(:user).should == user
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        response.should redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.any_instance.stub(:save).and_return(false)
        post :create, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance.should_receive(:update_attributes).with({these: "params"})
        put :update, id: user.id, user: {these: "params"}
      end

      it "assigns the requested user as @user" do
        put :update, id: user.id, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        assigns(:user).should == user
      end

      it "redirects to the user" do
        put :update, id: user.id, user: {name: "Bilbo Baggins", password: "asdf", password_confirmation: "asdf", email: "the tall tree"}
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.any_instance.stub(:save).and_return(false)
        put :update, id: user.id, user: {}
        assigns(:user).should == user
      end

      it "re-renders the 'edit' template" do
        User.any_instance.stub(:save).and_return(false)
        put :update, id: user.id, user: {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, id: user.id
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, id: user.id
      response.should redirect_to(users_url)
    end
  end
end
