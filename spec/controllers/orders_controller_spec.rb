require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrdersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.

  let (:sample_order) {
    Order.create
  }

  let (:bad_params) {
    {
      order: { zip: "zzz" }
    }
  }

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: sample_order.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    it "redirects to index page" do
      post :create
      expect(subject).to redirect_to orders_path
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: sample_order.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    it "redirects to index page" do
      patch :update, { order: { zip: "02780" } }
      expect(subject).to redirect_to orders_path
      expect(Order.all.last.zip).to eq "02780"
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
      expect(Order.all.last.zip).to eq nil
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, id: sample_order.id
      expect(subject).to redirect_to orders_path
    end
  end
end
