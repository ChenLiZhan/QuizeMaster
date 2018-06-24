# QuizeMaster

Rails + Reactアプリケーション

### ディレクトリ構成

```
.
├── app/                                 // Railsアプリ
│   ├── assets/　　　　　　　
│   └── controllers/                     //  APIなどコントローラー
│   └── helpers/                         //  helpers関数
│   └── javascripts/
│   │   └── packs/                        // Reactに関するもの（コンポーネントなど）
│   └── views/                            // Railsが返すHTML
├── bin/                                  // shellコマンド
├── config/                               //  railsとreactの設定ファイル
├── db/                                   //  db設定ファイル
├── node_modules/                         // nodeのパッケージはここにダウンロードされます
├── spec/                                 // Rails&Rubyテスト
├── lib/
├── log.
├── public/
├── storage/
├── test/
├── tmp/
├── vendor/
├── .gitignore
├── .babelrc                             // babel設定
├── .postcssrc                           // postcss設定
├── .rspec                               // rspec設定
├── .ruby-version 
├── .config.ru
├── Gemfile
├── Gemfile.lock
├── Package.json
├── Procfile.dev
├── Rakefile
└── yarn.lock
```

#### ./app/javascript/packs/quizMaster以下のディレクトリ構成

```
app/javascript/packs/quizMaster
├── assets/                       // 静的なCSSやイメージなど
├── components/                   // Reactのコンポーネントを定義
├── utils/                        // 共通なユーティリティを定義
├── routes.jsx                    // routerstを定義
└── index.js                      // エンドポイントとなるファイルです
```


### 主な利用ライブラリなど

| パッケージ | バージョン | 説明 |
|:---|---:|:---|
| [React](https://facebook.github.io/react/) | 16.4.1+    | JSでビューを生成するフレームワーク |
| [react-router](https://github.com/ReactTraining/react-router) |4.3.1+| Reactでルーティング |
| [superagent](https://github.com/visionmedia/superagent) |3.8.3+| HTTPをリクエストする|
| [Lodash](https://lodash.com/docs/4.17.10) |4.17.10+| 便利なユーティリティ |

### 起動手順

T.B.D

#### テストについて

T.B.D


#### yarn run コマンド

T.B.D


### 起動

T.B.D

