Rails.application.routes.draw do

  root to: "classifications#index"

  get '/classifications/show', :to => 'classifications#show'
  post '/classifications/classify', :to => 'classifications#classify'
  post '/classifications/train', :to => 'classifications#train'
end
