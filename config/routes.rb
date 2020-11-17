Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
#items_controllerを作ってindexアクションを定義→items／indexのビューファイルも作る→routes.rbでルートパスに指定する
end
