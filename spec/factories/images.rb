FactoryBot.define do
  factory :image do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/images/beef.jpeg"), 'image/png') }
  end
end
