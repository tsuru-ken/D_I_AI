
# User
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


# 会社登録
partner1 = Partner.create!(name: '株式会社DIVE INTO CODE', address: '〒150-0044 東京都渋谷区円山町28番4号大場ビルA館', url: 'https://diveintocode.jp/', established: '2015年4月10日', user_id: user1.id)
partner2 = Partner.create!(name: '株式会社Preferred Networks', address: '東京都千代田区大手町1-6-1大手町ビル', url: 'https://www.preferred.jp/ja/', established: '2014年3月26日', user_id: user2.id)
partner3 = Partner.create!(name: 'Global Walkers株式会社', address: '東京都品川区西五反田2-25-2 飯嶋ビル 5階', url: 'https://www.globalwalkers.co.jp/', established: '2016年6月1日', user_id: user3.id)
partner4 = Partner.create!(name: '株式会社システムズナカシマ', address: '岡山市東区上道北方688-1', url: 'https://www.systems.nakashima.co.jp/', established: '昭和60年4月1日', user_id: user4.id)
partner5 = Partner.create!(name: '株式会社 Ridge-i (リッジアイ）', address: '〒100-0004 東京都千代田区大手町1-6-1 大手町ビル438', url: 'https://ridge-i.com/', established: '2016年7月29日', user_id: user5.id)


# コスト感
Cost.create!(breakdown: "100万以下")
Cost.create!(breakdown: "100~300万")
Cost.create!(breakdown: "300~500万")
Cost.create!(breakdown: "500~2000万")
Cost.create!(breakdown: "2000万以上")

# 提供サービス
ServiceContent.create!(division: "AIコンサル")
ServiceContent.create!(division: "AI受託開発")
ServiceContent.create!(division: "AI教育")
ServiceContent.create!(division: "アノテーションサービス")
ServiceContent.create!(division: "データ分析")
ServiceContent.create!(division: "AI関連製品")
ServiceContent.create!(division: "AI導入サービス")
ServiceContent.create!(division: "その他")

# AI
AiCategory.create!(genre: "画像処理")
AiCategory.create!(genre: "自然言語処理")
AiCategory.create!(genre: "音声認識処理")
AiCategory.create!(genre: "時系列解析")
AiCategory.create!(genre: "最適化処理")


# OCRの初期データ（結果なし）
document1 =Document.create!(title: "", description: "", document_image: "")
document2 =Document.create!(title: "", description: "", document_image: "")
document3 =Document.create!(title: "", description: "", document_image: "")
document4 =Document.create!(title: "", description: "", document_image: "")
document5 =Document.create!(title: "", description: "", document_image: "")