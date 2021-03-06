# Otoderu

<p align="left"> 
  <img src="https://img.shields.io/badge/-HTML5-333.svg?logo=html5&style=flat">
  <img src="https://img.shields.io/badge/-CSS3-1572B6.svg?logo=css3&style=flat">
  <img src="https://img.shields.io/badge/-Rails-CC0000.svg?logo=rubyonrails&style=flat">
  <img src="https://img.shields.io/badge/Javascript-276DC3.svg?logo=javascript&style=flat">
  <img src="https://img.shields.io/badge/-Amazon%20AWS-232F3E.svg?logo=amazon-aws&style=flat">
</p>

![Demo](https://user-images.githubusercontent.com/83518855/131471852-b7817ded-56b1-412a-ac25-778ce5ecb9de.gif)

### [Otoderu(サイト URL)へ](https://otoderu.com)

## 概要

オーケストラ(吹奏楽)で使用する出欠管理システム

### テーマ

- 出欠入力を簡単にして管理状況を改善する。
- 出席状況を元にした練習計画により、1回 1回をより充実させる。
- 複数団体に所属している個人が一括して出欠状況を把握できるようにする。

### 作成に至った経緯

オーケストラでは出席者により練習する曲、順番を決める必要があり、出欠の把握が重要です。<br>
その理由は、<br>**1時間の曲の中で数秒しか音を出さない場合もあるから**。<br>
・・・というのは極端ではありますが、この楽器が揃うならこの部分を練習しよう、というのはよくある話です。<br>
そのため効率的な練習には団員の出欠の把握が欠かせません。<br>
しかし、実態としては、

- 面倒に感じて連絡しない
- 連絡忘れ
- スケジュール調整に時間を要した結果、連絡が漏れる

このようなことは多く発生してる問題です。<br>
もしクリア出来ればより良い練習が行うことができ、団体のレベルアップ、充実感が共有されることに繋がります。<br>

**もっと仲間と感動を共有したい**という想いからこのシステムの作成に至りました。

### 特徴
- ログイン後すぐに出欠入力が行える設計で団員の負担を最小限に。
- 複数団体に対応。スケジュール管理を一括で行えます。
- GoogleMapを使用しており会場までの道のりがすぐ分かります。
- 練習予定の登録には過去の練習予定を見ながら検討できます。

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

- SQL 発行の改善
- DRY に基づいた記載
- 予定の一括入力機能
- Slackbotとの連携（バージョンアップ）

頂いた[レビュー](https://docs.google.com/spreadsheets/d/1ncuHkSPa2KOA9w-8PAqZyYjZSPjEKQVvLZSY_Tatpx4/edit?usp=sharing)を参考にしながら改善に努めて参ります。

## 設計書

- [テーブル定義書](https://docs.google.com/spreadsheets/d/1a9zYIdhUhD_8Z63i26BLWO315mVppMZ7koWDFI5wkVA/edit?usp=sharing)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1lXLAcZVtGDKtB71RUtqQRwT3cMNWfw1PctalsSpCccA/edit?usp=sharing)
- ER 図  
  ![ER図](https://user-images.githubusercontent.com/83518855/134440951-acb6c928-3ca6-4d99-976d-40e85e25b100.png)
  
## 使用方法

```
$ git clone git@github.com:sagittarius3008/Otoderu.git
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## 開発環境

- OS：Amazon Linux2(karoo)
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

