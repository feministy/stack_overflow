FactoryGirl.define do
  
  factory :question do
    title   "sample title"
    content "sample content"
    user_id 1
  end    

  factory :answer do
    content     "sample answer"
    question_id 1
    user_id     1
  end

  factory :user do
    username "niles" 
    email    "niles@neville.com" 
    password "1234"
  end

  factory :comment do
    content  "sample comment"
    user_id  1
  end

  factory :vote do
    value   1
    user_id 1
  end

  factory :tag do
    name "sample tag"
  end

end
