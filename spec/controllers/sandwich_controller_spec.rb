require 'spec_helper'

describe SandwichesController do
  # This should return the minimal set of attributes required to create a valid
  # Sandwich. As you add validations to Sandwich, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:sandwich_type => "Meatball"}
  end


  describe "GET index" do
    it "assigns all sandwiches as @sandwiches" do
      sandwich = create(:sandwich)
      get :index
      assigns(:sandwiches).should eq([sandwich])
    end
  end

  describe "GET show" do
    it "assigns the requested sandwich as @sandwich" do
      sandwich = create(:sandwich)
      get :show, :id => sandwich.id.to_s
      assigns(:sandwich).should eq(sandwich)
    end
  end

  describe "GET new" do
    it "assigns a new sandwich as @sandwich" do
      get :new
      assigns(:sandwich).should be_a_new(Sandwich)
    end
  end

  describe "GET edit" do
    it "assigns the requested sandwich as @sandwich" do
      sandwich = create(:sandwich)
      get :edit, :id => sandwich.id.to_s
      assigns(:sandwich).should eq(sandwich)
    end
  end

  describe "POST create" do
    before do
      Twitter.stub!(:direct_message_create).and_return(true)
    end
    describe "with valid params" do
      it "creates a new Sandwich" do
        expect {
          post :create, :sandwich => valid_attributes
        }.to change(Sandwich, :count).by(1)
      end

      it "should send a twitter dm to rebmaeneri" do
        Twitter.should_receive(:direct_message_create).with("rebmaeneri", "Wich-Wizard sandwich request! Please make a Meatball sandwich. :)")
        post :create, :sandwich => valid_attributes
      end

      it "assigns a newly created sandwich as @sandwich" do
        post :create, :sandwich => valid_attributes
        assigns(:sandwich).should be_a(Sandwich)
        assigns(:sandwich).should be_persisted
      end

      it "redirects to the created sandwich" do
        post :create, :sandwich => valid_attributes
        response.should redirect_to(Sandwich.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sandwich as @sandwich" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sandwich.any_instance.stub(:save).and_return(false)
        post :create, :sandwich => {}
        assigns(:sandwich).should be_a_new(Sandwich)
      end

      it "re-renders the 'new' template" do
        sandwich = Sandwich.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sandwich.any_instance.stub(:save).and_return(false)
        Sandwich.any_instance.stub(:errors).and_return(:count => 0)
        post :create, :id => sandwich.id.to_s, :sandwich => {}
        response.should render_template("new")
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested sandwich" do
          sandwich = Sandwich.create! valid_attributes
          # Assuming there are no other sandwiches in the database, this
          # specifies that the Sandwich created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Sandwich.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => sandwich.id, :sandwich => {'these' => 'params'}
        end

        it "assigns the requested sandwich as @sandwich" do
          sandwich = Sandwich.create! valid_attributes
          put :update, :id => sandwich.id, :sandwich => valid_attributes
          assigns(:sandwich).should eq(sandwich)
        end

        it "redirects to the sandwich" do
          sandwich = Sandwich.create! valid_attributes
          put :update, :id => sandwich.id, :sandwich => valid_attributes
          response.should redirect_to(sandwich)
        end
      end

      describe "with invalid params" do
        it "assigns the sandwich as @sandwich" do
          sandwich = Sandwich.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Sandwich.any_instance.stub(:save).and_return(false)
          put :update, :id => sandwich.id.to_s, :sandwich => {}
          assigns(:sandwich).should eq(sandwich)
        end

        it "re-renders the 'edit' template" do
          sandwich = Sandwich.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Sandwich.any_instance.stub(:save).and_return(false)
          Sandwich.any_instance.stub(:errors).and_return(:count => 0)
          put :update, :id => sandwich.id.to_s, :sandwich => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested sandwich" do
        sandwich = Sandwich.create! valid_attributes
        expect {
          delete :destroy, :id => sandwich.id.to_s
        }.to change(Sandwich, :count).by(-1)
      end

      it "redirects to the sandwichs list" do
        sandwich = Sandwich.create! valid_attributes
        delete :destroy, :id => sandwich.id.to_s
        response.should redirect_to(sandwiches_url)
      end
    end
  end

end
