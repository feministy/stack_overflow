FactoryGirl.define do
  factory :question do
    title   "sample title"
    content "sample content"
    user_id 1
  end    

  factory :user do
    username "niles" 
    email    "niles@neville.com" 
    password "1234"
    
  end

end
