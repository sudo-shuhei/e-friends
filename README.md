## ゲームのフレンド検索アプリ

### 概要
ゲームのフレンド募集アプリです。
募集記事を投稿、リクエストができます。
投稿にリクエスト送信→承認→DMという流れ

### 機能
- ユーザー周りの基本的な機能　ログイン、ログアウト...
- フレンド機能、DM機能
- フレンド募集記事投稿機能
- ページネーション機能
- 投稿検索機能
  +Ajaxを用いたインクリメンタルサーチ機能

### 使用技術
- 開発環境　macbook, Ubuntu18.04
- Ruby on Rails; ruby(2.5.7) Rails(5.1.3)
- docker
- AWSEC2; デプロイ
  webサーバー;nginx アプリケーションサーバー;Unicorn
- bootstrap; css,レスポンシブデザイン
- rspec/featurespec; 単体/統合テスト
- gem devise; ユーザー周りの機能
- gem carrierwave; 画像アップロード機能
- gem kaminari; ページネーション
- gem ransack; 検索機能
- jQuery,Ajax; インクリメンタルサーチ
