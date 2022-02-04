require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do
  let(:user_name){'jk'}
  it 'calls SKU service with correct params' do
    allow(Net::HTTP).to receive(:start).and_return(true)
    expect_any_instance_of(Net::HTTP::Post).to receive(:body=).with(
      {sku: '123', username: user_name}.to_json
    )

    described_class.perform_now(user_name)
  end

end
