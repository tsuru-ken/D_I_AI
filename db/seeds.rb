
Cost.create!(breakdown: "100万以下")
Cost.create!(breakdown: "100~300万")
Cost.create!(breakdown: "300~500万")
Cost.create!(breakdown: "500~2000万")
Cost.create!(breakdown: "2000万以上")


ServiceContent.create!(division: "AIコンサル")
ServiceContent.create!(division: "AI受託開発")
ServiceContent.create!(division: "AI教育")
ServiceContent.create!(division: "アノテーションサービス")
ServiceContent.create!(division: "データ分析")
ServiceContent.create!(division: "AI関連製品")
ServiceContent.create!(division: "AI導入サービス")
ServiceContent.create!(division: "その他")


AiCategory.create!(genre: "画像処理")
AiCategory.create!(genre: "自然言語処理")
AiCategory.create!(genre: "音声認識処理")
AiCategory.create!(genre: "時系列解析")
AiCategory.create!(genre: "最適化処理")




