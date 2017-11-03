require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

     describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
 
      it "instantiates @advertisement" do
        get :new
        expect(assigns(:advertisement)).not_to be_nil
      end
    end
 
    describe "POST create" do
 
      it "increases the number of Advertisement by 1" do
        expect{ advertisement :create, params: { advertisement: { title: "Anacin", copy: "Fast, fast, incredibly fast relief", price: 10 } } }.to change(Advertisement,:count).by(1)
      end
 
 
      it "assigns the new advertisement to @advertisement" do
        advertisement :create, params: { advertisement: { title: "Anacin", copy:  "Fast, fast, incredibly fast relief", price: 10 } }
        expect(assigns(:advertisement)).to eq Advertisement.last
      end
 
 
      it "redirects to the advertisement" do
        advertisement :create, params: { advertisement: { title: "Anacin", copy:  "Fast, fast, incredibly fast relief", price: 10  } }
        expect(response).to redirect_to Advertisement.last
      end
    end

end
