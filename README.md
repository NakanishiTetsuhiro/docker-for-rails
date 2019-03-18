# docker-for-rails

Rails動かす用のDocker環境です

## How to use

1. `mv docker-for-rails YOUR_PROJECT_NAME`
2. `cd YOUR_PROJECT_NAME`
3. `cp env-example .env`
4. .envに値を書き込む
5. railsプロジェクトをcloneしてきて、ディレクトリ名をappに変更
6. `docker-compose build`
7. `docker-compose run --rm yarn install`
8. `docker-compose run --rm yarn run dev`
9. `docker-compose run --rm web bundle exec rails db:create`
10. `docker-compose run --rm web bundle exec rails db:migrate`
11. `docker-compose up -d`

## Special Thanks!

- [Rails+PostgreSQLの環境をdocker-composeで作成する - Qiita](https://qiita.com/atzu/items/4ca6306087e3813b0941)
- [rails sコマンド実行時に「Could not find a JavaScript runtime.」とエラーが出る場合の対処法 - Qiita](https://qiita.com/azusanakano/items/771dc9919f347de061d7)
