require "spec_helper"

describe CommentsController do

  describe "GET index" do
    it "assigns all comments as @comments" do
      comment = Comment.create! {}
      get :index
      assigns(:comments).should == [comment]
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! {}
      get :show, :id => comment.id
      assigns(:comment).should == comment
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! {}
      get :edit, :id => comment.id
      assigns(:comment).should == comment
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, :comment => {}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, :comment => {}
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, :comment => {}
        response.should redirect_to(Comment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        Comment.any_instance.stub(:save).and_return(false)
        post :create, :comment => {}
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        Comment.any_instance.stub(:save).and_return(false)
        post :create, :comment => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! {}
        Comment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => comment.id, :comment => {'these' => 'params'}
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! {}
        put :update, :id => comment.id, :comment => {}
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! {}
        put :update, :id => comment.id, :comment => {}
        response.should redirect_to(comment)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! {}
        Comment.any_instance.stub(:save).and_return(false)
        put :update, :id => comment.id, :comment => {}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! {}
        Comment.any_instance.stub(:save).and_return(false)
        put :update, :id => comment.id, :comment => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! {}
      expect {
        delete :destroy, :id => comment.id
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! {}
      delete :destroy, :id => comment.id
      response.should redirect_to(comments_url)
    end
  end

end
