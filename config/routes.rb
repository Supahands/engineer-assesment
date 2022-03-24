Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/message_of_the_day/post_message', to: 'message_of_the_day#post_message', as: :message_of_the_day
end
