#URLにアクセスするためのライブラリの読み込み
require 'open-uri'
#Nokogiriライブラリの読み込み
require 'nokogiri'

#スクレイピング先のURL
url = 'http://www.yahoo.co.jp/'

charset = nil
html = open(url) do |f|
  charset = f.charset #文字種別を取得
  f.read #htmlを読み込んで変数htmlに渡す
end

#p html

#htmlをパース（解析）してオブジェクトを生成
doc = Nokogiri::HTML.parse(html,nil,charset)

#タイトルを表示
p doc.title

p doc.css('div#yahooservice')