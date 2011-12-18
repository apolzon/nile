require "spec_helper"

describe UsersController do

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! {}
      get :index
      assigns(:users).should == [user]
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! {}
      get :show, :id => user.id
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
      user = User.create! {}
      get :edit, :id => user.id
      assigns(:user).should == user
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, :user => {}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, :user => {}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, :user => {}
        response.should redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! {}
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => user.id, :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        user = User.create! {}
        put :update, :id => user.id, :user => {}
        assigns(:user).should == user
      end

      it "redirects to the user" do
        user = User.create! {}
        put :update, :id => user.id, :user => {}
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! {}
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id, :user => {}
        assigns(:user).should == user
      end

      it "re-renders the 'edit' template" do
        user = User.create! {}
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id, :user => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! {}
      expect {
        delete :destroy, :id => user.id
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! {}
      delete :destroy, :id => user.id
      response.should redirect_to(users_url)
    end
  end

end
