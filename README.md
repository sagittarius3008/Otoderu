# Otoderu

## サイト概要

オーケストラ(吹奏楽)で使用する出欠管理システム

### サイトテーマ

出欠入力を簡単にして管理の質を高める。
出席状況を元にした練習内容の構成により、1 回 1 回をより充実させることを目的する。

### テーマを選んだ理由

オーケストラでは出席者により練習する曲、順番を決めるため出欠の把握が重要である。
しかし、多くの団体では出欠連絡を促すという、個人の責任感に任せた管理となっている。
今回、スラック bot と連携した、出欠連絡の仕組みを改善することで出欠連絡率を高める方法を提案する。
尚、最近ではコロナ影響により什器の使用も個数制限を課せられ、従来より確実な人数把握が求められている。

### ターゲットユーザ

オーケストラ団体、吹奏楽団

## 主要な機能

|      | 機能                     | 使用 Gem/備考                     |
| ---- | ------------------------ | --------------------------------- |
| １   | 団員/団体ログイン機能    | devise                            |
| ２   | ゲストログイン機能       |                                   |
| ３   | devise 日本語化          | rails-i18n                        |
| ４   | 練習予定作成機能         | -                                 |
| ５   | 出欠入力機能             | Ajax(非同期通信)                  |
| ６   | 検索機能                 | -(団体検索/出欠表示の絞り込み)    |
| ７   | 通知機能                 | -(未回答の予定/入団申請数)        |
| ８   | CSV 出力機能             | -(練習の参加者リスト)             |
| ９   | N ＋１問題               | bullet                            |
| １０ | モーダルウィンドウ       | -                                 |
| １１ | ページネーション機能     | kaminari                          |
| １２ | カレンダー機能           | simple_calender                   |
| １３ | 動きのある背景           | particles.js                      |
| １４ | 地図表示                 | googlemapAPI                      |
| １５ | 単体・結合テスト（一部） | RSpec                             |
| １６ | ドメイン指定             | お名前ドットコム                  |
| １７ | https 設定               | AWS(Certificate Manager・Route53) |
| １８ | 自動デプロイ             | Github Actions                    |

[機能の一覧・詳細はこちら](https://docs.google.com/spreadsheets/d/1yHLfj2vTUaqEzmE4-0uya6wkFhEpDJf8KrDFfRTXmSc/edit?usp=sharing)

## 今後の課題

- レスポンシブ対応
- SQL 発行の改善
- DRY な記載

頂いた[レビュー](https://docs.google.com/spreadsheets/d/1ncuHkSPa2KOA9w-8PAqZyYjZSPjEKQVvLZSY_Tatpx4/edit?usp=sharing)を参考にしながら改善に努めて参ります。

## 設計書

- ER 図
  ![ER図](https://user-images.githubusercontent.com/83518855/129730921-1d76384f-7787-4f0f-b098-88af53a7f5c7.png)
- [URL](https://otoderu.com)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1a9zYIdhUhD_8Z63i26BLWO315mVppMZ7koWDFI5wkVA/edit?usp=sharing)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1lXLAcZVtGDKtB71RUtqQRwT3cMNWfw1PctalsSpCccA/edit?usp=sharing)

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 写真提供

- [fotofolly](https://fotofolly.com/bridal/)
- Musica Promenade

## 使用素材

- [OSDN（IPA フォント）](https://ja.osdn.net/)
- [favicon.cc](https://www.favicon.cc)
- [silhouetteAC](https://www.silhouette-ac.com/)
- [Font Awesome](https://fontawesome.com/)
