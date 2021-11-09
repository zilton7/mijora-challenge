require 'rails_helper'

Rails.application.load_tasks

describe "sync data" do
  let(:json_response) do
    [{
      'ZIP' => '88888',
      'NAME' => 'Whatever'
    }]
  end
  after(:each) do
    Rake::Task["sync_data:sync"].reenable
  end
  context "when parcel machine exists" do
    let(:parcel){ ParcelMachine.find_by(zip: '88888') }

    before do
      ParcelMachine.create(zip: '88888')
      allow(HTTParty).to receive(:get).and_return(json_response)
      Rake::Task["sync_data:sync"].invoke
      parcel.reload
    end
    
    it 'updates the parcel machine name' do
      expect(parcel.name).to match('Whatever')
    end

    it 'does not create a new parcel machine' do
      expect(ParcelMachine.all.count).to eq(1)
    end
  end

  context "when parcel machine doesn't exist" do
    before do
      allow(HTTParty).to receive(:get).and_return(json_response)
      Rake::Task["sync_data:sync"].invoke
    end

    it "creates parcel machine" do
      expect(ParcelMachine.all.count).to eq(1)
    end
  end
end