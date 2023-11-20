アプリ名

cooktweet


アプリケーションの概要

ユーザー登録することで自身が作ったレシピを周りで共有できるようになります。検索時に自宅にある食材や調味料を選択することで今あるもので別のアレンジをしている方のレシピを閲覧できます。
これにより家にあるものだけで別のアレンジレシピを見ることができ更に一度しかつかわないような調味料を余分に買わずに食卓の献立の幅を広げることができます。

URL


テスト用アカウント


利用方法
・ユーザー登録しなくてもツイート一覧及びツイート詳細表示可能
・ユーザー登録後ツイートの作成、編集、削除が可能
・画面上部にあるツイートボタンにてツイートフォームに遷移しツイートの作成
・画面サイドにある検索フォームに遷移し検索をする
・検索時、「含む」「のみ」のチェック欄を指定することで特定の食材や調味料を使用したレシピの検索をすることができる


アプリケーションを作成した背景
今回このアプリを作成しようとしたのかというと普段料理をする中で限られた食材や調味料では基本同じものしか作ることができません。更に他のアプリでは、レシピを検索しても普段料理をしてもつかわない、使ったことがない調味料
を使っていたり、新しく調味料を買っても一回しか使わないこともあるのでそういった主婦や料理をする方が無駄な買い物や自分とは違うアレンジをした料理をしているレシピを閲覧してもらい日々の生活に少しでも面白さや楽しさが
出てくるようにと思いアプリを作ろうと思いました。

実装した機能についての画像やGIFおよびその説明


実装予定の機能
・ツイート一覧機能
・ツイート投稿機能
・ツイート編集・削除機能
・ツイート詳細機能
・詳細検索機能
・いいね機能


データベース設計




## users テーブル

| Columu                 | Type       | Options        |
|------------------------|------------|----------------|
| name                   | string     | null: false    |
| email                  | string     | null: false    |
| encypted_password      | string     | null: false    |


### Association
- has_many :resipes
- has_many :likes


## resipes テーブル

| Columu                       | Type        | Options                          |
|------------------------------|-------------|----------------------------------|
| title                        | string      | null: false                      |
| explanation                  | text        | null: false                      |
| procedure                    | text        | null: false                      |
| user                         | references  |  null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_many :ingredients, through :resipe_ingredients
- has_many :seasonings, through :resipe_seasonings
- has_many :likes



## likes テーブル

| Colum                   | Type           | Options                           |
|-------------------------|----------------|-----------------------------------|
| user                    | references     | null: false, foreign_key: true    |
| resipe                  | references     | null: false, foreign_key: true    |


### Association
- belongs_to :user
- belongs_to :recipe



## ingredients テーブル

| Columu                 | Type       | Options        |
|------------------------|------------|----------------|
| name                   | string     | null: false    |


### Association
- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients



## resipe_ingredients テーブル

| Columu                      | Type           | Options                           |
|-----------------------------|----------------|-----------------------------------|
| resipe                      | references     | null: false, foreign_key: true    |
| ingredient                  | references     | null: false, foreign_key: true    |


### Association
- belongs_to :recipe
- belongs_to :ingredient




## seasonings テーブル

| Columu                 | Type       | Options        |
|------------------------|------------|----------------|
| name                   | string     | null: false    |


### Association
- has_many :recipe_seasonings
- has_many :recipes, through: :recipe_seasonings


## resipe_seasonings テーブル

| Columu                     | Type           | Options                           |
|----------------------------|----------------|-----------------------------------|
| resipe                     | references     | null: false, foreign_key: true    |
| seasoning                  | references     | null: false, foreign_key: true    |


### Association
- belongs_to :recipe
- belongs_to :seasoning