FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
    admin true
  end

  factory :userNoAdmin, class: User do
    username "Jonne"
    password "Foobar1"
    password_confirmation "Foobar1"
    admin false
  end


  factory :recipe do
    name "Potut"
    user
  end
end
