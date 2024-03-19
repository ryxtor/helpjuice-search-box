FactoryBot.define do
  factory :user do
    ip_address { IPAddr.new(rand(2**32), Socket::AF_INET).to_s }
  end
end
