#URLにアクセスするためのライブラリの読み込み
require 'open-uri'
#Nokogiriライブラリの読み込み
require 'nokogiri'

#スクレイピング先のURL
# url = 'http://logmi.jp/category/it/page/32' # ループの最後の方をテストするために後半からスタートする
url = 'http://logmi.jp/category/it/'

while true
  sleep(1)
  html = open(url) do |f|
    f.read #htmlを読み込んで変数htmlに渡す
  end
  #htmlをパース（解析）してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html)
  titles = doc.css('div#common-list-block div.inner ul.common-log-list li a div.text-title')
  titles.each do |node|
    p node.text.strip
  end  
  break if doc.css('div#common-list-block div.inner div.wp-pagenavi a.nextpostslink').length == 0
  url = doc.css('div#common-list-block div.inner div.wp-pagenavi a.nextpostslink').attribute('href').value
  text_page = doc.css('div#common-list-block div.inner div.wp-pagenavi span.current').text
  p text_page
  url = doc.css('div#common-list-block div.inner div.wp-pagenavi a.nextpostslink').attribute('href').value
end

