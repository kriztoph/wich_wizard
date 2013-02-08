require 'spec_helper'

describe SandwichOrdersController do
  # This should return the minimal set of attributes required to create a valid
  # Sandwich. As you add validations to Sandwich, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:orderer_name => "Kriz"}
  end


  describe "GET index" do
    it "assigns all sandwich_orders as @sandwich_orders" do
      sandwich_order = create(:sandwich_order)
      get :index
      assigns(:sandwich_orders).should eq([sandwich_order])
    end
  end

  describe "GET show" do
    it "assigns the requested sandwich_order as @sandwich_order" do
      sandwich_order = create(:sandwich_order)
      get :show, :id => sandwich_order.id.to_s
      assigns(:sandwich_order).should eq(sandwich_order)
    end
  end

  describe "GET new" do
    it "assigns a new sandwich_order as @sandwich_order" do
      get :new
      assigns(:sandwich_order).should be_a_new(SandwichOrder)
    end
  end

  describe "GET edit" do
    it "assigns the requested sandwich_order as @sandwich_order" do
      sandwich_order = create(:sandwich_order)
      get :edit, :id => sandwich_order.id.to_s
      assigns(:sandwich_order).should eq(sandwich_order)
    end
  end

  describe "POST create" do
    before do
      Twitter.stub!(:direct_message_create).and_return(false)
    end
    describe "with valid params" do
      it "creates a new SandwichOrder" do
        expect {
          post :create, :sandwich_order => valid_attributes
        }.to change(SandwichOrder, :count).by(1)
      end

      it "should send a twitter dm to rebmaeneri" do
        Twitter.should_receive(:direct_message_create).with(kind_of(String), kind_of(String)).once
        post :create, :sandwich_order => valid_attributes
      end

      it "assigns a newly created sandwich_order as @sandwich_order" do
        post :create, :sandwich_order => valid_attributes
        assigns(:sandwich_order).should be_a(SandwichOrder)
        assigns(:sandwich_order).should be_persisted
      end

      it "redirects to the root_path" do
        post :create, :sandwich_order => valid_attributes
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sandwich as @sandwich" do
        # Trigger the behavior that occurs when invalid params are submitted
        SandwichOrder.any_instance.stub(:save).and_return(false)
        post :create, :sandwich_order => {}
        assigns(:sandwich_order).should be_a_new(SandwichOrder)
      end

      it "re-renders the 'new' template" do
        sandwich_order = SandwichOrder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SandwichOrder.any_instance.stub(:save).and_return(false)
        SandwichOrder.any_instance.stub(:errors).and_return(:count => 0)
        post :create, :id => sandwich_order.id.to_s, :sandwich_order => {}
        response.should render_template("new")
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested sandwich" do
          sandwich = SandwichOrder.create! valid_attributes
          # Assuming there are no other sandwich_orders in the database, this
          # specifies that the Sandwich created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          SandwichOrder.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => sandwich.id, :sandwich_order => {'these' => 'params'}
        end

        it "assigns the requested sandwich order as @sandwich_order" do
          sandwich_order = SandwichOrder.create! valid_attributes
          put :update, :id => sandwich_order.id, :sandwich_order => valid_attributes
          assigns(:sandwich_order).should eq(sandwich_order)
        end

        it "redirects to the sandwich" do
          sandwich_order = SandwichOrder.create! valid_attributes
          put :update, :id => sandwich_order.id, :sandwich_order => valid_attributes
          response.should redirect_to(sandwich_order)
        end
      end

      describe "with invalid params" do
        it "assigns the sandwich as @sandwich" do
          sandwich_order = SandwichOrder.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          SandwichOrder.any_instance.stub(:save).and_return(false)
          put :update, :id => sandwich_order.id.to_s, :sandwich_order => {}
          assigns(:sandwich_order).should eq(sandwich_order)
        end

        it "re-renders the 'edit' template" do
          sandwich_order = SandwichOrder.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          SandwichOrder.any_instance.stub(:save).and_return(false)
          SandwichOrder.any_instance.stub(:errors).and_return(:count => 0)
          put :update, :id => sandwich_order.id.to_s, :sandwich_order => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested sandwich" do
        sandwich_order = SandwichOrder.create! valid_attributes
        expect {
          delete :destroy, :id => sandwich_order.id.to_s
        }.to change(SandwichOrder, :count).by(-1)
      end

      it "redirects to the sandwichs list" do
        sandwich_order = SandwichOrder.create! valid_attributes
        delete :destroy, :id => sandwich_order.id.to_s
        response.should redirect_to(sandwich_orders_url)
      end
    end
  end

end
