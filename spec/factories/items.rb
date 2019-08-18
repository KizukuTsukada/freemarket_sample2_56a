FactoryBot.define do
  factory :item do
    name            {"test-item"}
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/buyitem.png'))
    price           {1000}
    status          {"目立った傷や汚れなし"}
    deliver_date    {"1~2日で発送"}
    deliver_fee     {"送料込み(出品者負担)"}
    detail          {"テストの商品です"}
    association :saler, factory: :user
  end
end