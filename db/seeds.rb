
# Users
admin_user = User.create(name: "つるけん", email: "admin@admin.com", password: "123456")


  User.create([
    { name: "坂本", email: "test1@email.com", password: "123456" },
    { name: "古谷", email: "test2@email.com", password: "123456" },
    { name: "高橋", email: "test3@email.com", password: "123456" },
    { name: "箱崎", email: "test4@email.com", password: "123456" },
    { name: "安達", email: "test5@email.com", password: "123456" },
    { name: "新小倉", email: "test6@email.com", password: "123456" },
    { name: "井上", email: "test7@email.com", password: "123456" },
    { name: "成川", email: "test8@email.com", password: "123456" },
    { name: "今村", email: "test9@email.com", password: "123456" },
    { name: "サダラ", email: "test10@email.com", password: "123456" },
    { name: "大西", email: "test11@email.com", password: "123456" },
    ])

# 100万以下から2000万以上までのCostsを作成
Cost.create!(breakdown: "100万以下")
Cost.create!(breakdown: "100~300万")
Cost.create!(breakdown: "300~500万")
Cost.create!(breakdown: "500~2000万")
Cost.create!(breakdown: "2000万以上")

# Service Contentsを作成
ServiceContent.create!(division: "AIコンサル")
ServiceContent.create!(division: "AI受託開発")
ServiceContent.create!(division: "AI教育")
ServiceContent.create!(division: "アノテーションサービス")
ServiceContent.create!(division: "データ分析")
ServiceContent.create!(division: "AI関連製品")
ServiceContent.create!(division: "AI導入サービス")
ServiceContent.create!(division: "その他")

# AI Categoriesを作成
AiCategory.create!(genre: "画像処理")
AiCategory.create!(genre: "自然言語処理")
AiCategory.create!(genre: "音声認識処理")
AiCategory.create!(genre: "時系列解析")
AiCategory.create!(genre: "最適化処理")



breakdowns = ["100万以下", "100~300万", "300~500万", "500~2000万", "2000万以上"]
division_list = ["AIコンサル", "AI受託開発", "AI教育", "アノテーションサービス", "データ分析", "AI関連製品", "AI導入サービス", "その他"]
genre_list = ["画像処理", "自然言語処理", "音声認識処理", "時系列解析", "最適化処理"]

# インデックス0の値を取得
breakdown = breakdowns[0]
division = division_list[0]
genre = genre_list[0]


# 1社目
Partner.create!(
  name: '株式会社DIVE INTO CODE',
  address: '〒150-0044 東京都渋谷区円山町28番4号大場ビルA館',
  url: 'https://diveintocode.jp/',
  established: '2015年4月10日',
  service: '人材育成・教育サービス',
  engineer: '非公開',
  provision: "その他",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.find_by(genre: "画像処理")
partner.costs << Cost.find_by(breakdown: "100万以下")
partner.service_contents << ServiceContent.find_by(division: "AIコンサル")

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'プログラミングスクール「DIVE INTO CODE」',
  content: 'https://diveintocode.jp/courses_list',
  image: File.open("./app/assets/images/DIC.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: 'DIVE INTO CODEがお送りする、リアルなスクール生活や技術記事
  DIVE INTO CODE MEDIA',
  content: 'https://diveintocode.jp/blogs',
  image: File.open("./app/assets/images/DIC_blog.png"),
  partner: partner
)


# ２社目
Partner.create!(
  name: '株式会社DIVE INTO CODE',
  address: '〒150-0044 東京都渋谷区円山町28番4号大場ビルA館',
  url: 'https://diveintocode.jp/',
  established: '2015年4月10日',
  service: '人材育成・教育サービス',
  engineer: '非公開',
  provision: "その他",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.find_by(genre: "画像処理")
partner.costs << Cost.find_by(breakdown: "100万以下")
partner.service_contents << ServiceContent.find_by(division: "AIコンサル")

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'プログラミングスクール「DIVE INTO CODE」',
  content: 'https://diveintocode.jp/courses_list',
  image: File.open("./app/assets/images/DIC.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: 'DIVE INTO CODEがお送りする、リアルなスクール生活や技術記事
  DIVE INTO CODE MEDIA',
  content: 'https://diveintocode.jp/blogs',
  image: File.open("./app/assets/images/DIC_blog.png"),
  partner: partner
)



# # Partners
# partner1 = Partner.create!(
#   name: '株式会社DIVE INTO CODE',
#   address: '〒150-0044 東京都渋谷区円山町28番4号大場ビルA館',
#   url: 'https://diveintocode.jp/',
#   established: '2015年4月10日',
#   service: "service1",
#   engineer: "engineer1",
#   provision: 100,
#   product: "product1",
#   case: "case1",
#   user_id: user1.id)

# partner2 = Partner.create!(
#   name: '株式会社Preferred Networks',
#   address: '東京都千代田区大手町1-6-1大手町ビル',
#   url: 'https://www.preferred.jp/ja/',
#   established: '2014年3月26日',
#   service: "service1",
#   engineer: "engineer1",
#   provision: 100,
#   product: "product1",
#   case: "case1",
#   user_id: user2.id)

# partner3 = Partner.create!(
#   name: 'Global Walkers株式会社',
#   address: '東京都品川区西五反田2-25-2 飯嶋ビル 5階',
#   url: 'https://www.globalwalkers.co.jp/',
#   established: '2016年6月1日',
#   service: "service1",
#   engineer: "engineer1",
#   provision: 100,
#   product: "product1",
#   case: "case1",
#   user_id: user3.id)

# partner4 = Partner.create!(
#   name: '株式会社システムズナカシマ',
#   address: '岡山市東区上道北方688-1',
#   url: 'https://www.systems.nakashima.co.jp/',
#   established: '昭和60年4月1日',
#   service: "service1",
#   engineer: "engineer1",
#   provision: 100,
#   product: "product1",
#   case: "case1",
#   user_id: user4.id)

# partner5 = Partner.create!(
#   name: '株式会社 Ridge-i (リッジアイ）',
#   address: '〒100-0004 東京都千代田区大手町1-6-1 大手町ビル438',
#   url: 'https://ridge-i.com/',
#   established: '2016年7月29日',
#   service: "service1",
#   engineer: "engineer1",
#   provision: 100,
#   product: "product1",
#   case: "case1",
#   user_id: user5.id)




  # # ランダムなレコードを選択
  # ai_category = AiCategory.order("RANDOM()").first
  # cost = Cost.order("RANDOM()").first
  # service_content = ServiceContent.order("RANDOM()").first

  # # Partnerレコードを作成
  # partner = Partner.create!(
  #   name: "パートナー名",
  #   address: "東京都港区1-1-1",
  #   url: "https://example.com/",
  #   established: "2020-01-01",
  #   service: "サービス内容",
  #   engineer: "エンジニア名",
  #   provision: "クラウド",
  #   product: "製品内容",
  #   case: "事例内容",
  #   user_id: 1
  # )

  # # PartnerAiCategoryLabelレコードを作成
  # partner.partner_ai_category_labels.create!(
  #   ai_category_id: ai_category.id
  # )

  # # PartnerCostLabelレコードを作成
  # partner.partner_cost_labels.create!(
  #   cost_id: cost.id
  # )

  # # PartnerServiceContentLabelレコードを作成
  # partner.partner_service_content_labels.create!(
  #   service_content_id: service_content.id
  # )

  # # ProductInfoレコードを作成
  # partner.product_infos.create!(
  #   name: "製品名",
  #   content: "製品内容",
  #   image: "https://example.com/image.jpg"
  # )

  # # CaseStudyレコードを作成
  # partner.case_studies.create!(
  #   name: "事例名",
  #   content: "事例内容",
  #   image: "https://example.com/image.jpg"
  # )

  # # ai_categoriesテーブルから適当なジャンルを取得
# genre = AiCategory.pluck(:genre).sample

# # costsテーブルから適当な項目を取得
# breakdown = Cost.pluck(:breakdown).sample

# # service_contentsテーブルから適当なdivisionを取得
# division = ServiceContent.pluck(:division).sample