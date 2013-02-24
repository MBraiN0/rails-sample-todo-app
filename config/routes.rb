DemoApp::Application.routes.draw do

  resources :projects do
    resources :todo_lists do
      resources :todo_items
    end
  end

end
