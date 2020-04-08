Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  root 'items#index'
  # root 'items#t_user_credit_link'

  # 商品詳細画面確認用
  resources :items do
    collection do
      # # のちのちmember
      get 't_user_credit_detail'
      get 't_user_credit_link'
      get 't_user_logout'
      get 't_user_show'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'buy'# # のちのちmember
    end
  end
end
