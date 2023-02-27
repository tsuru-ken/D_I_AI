
# Users
# 管理者ユーザーの作成
admin_user = User.find_or_create_by(email: "admin@admin.com") do |u|
  u.name = "アドミンつるけん"
  u.password = "123456"
  u.admin = true
end
admin_user.update(login_token: nil)

# 一般ユーザーの作成
normal_user = User.create(name: "normal_user", email: "test@email.com", password: "123456")

# 管理者ユーザーのゲストログイン用アカウントの作成
admin_guest_user = User.find_or_create_by(email: 'admin_guest@example.com') do |u|
  u.name = 'admin_guest_user'
  u.password = '123456'
  u.admin = true
end
admin_guest_user.update(login_token: nil)

# 一般ユーザーのゲストログイン用アカウントの作成
normal_guest_user = User.find_or_create_by(email: 'normal_guest@example.com') do |u|
  u.name = 'normal_guest_user'
  u.password = '123456'
end
normal_guest_user.update(login_token: nil)
# このseed.rbファイルを実行することで、管理者ユーザーと一般ユーザーの両方に、ゲストログイン用アカウントとログイン用トークンが作成されます。ゲストログイン用アカウントはランダムなパスワードを持ち、ログイン用トークンはログイン時に必要となります。






  User.create([
    { name: "つるだ", email: "test1@email.com", password: "123456" },
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

# OCRの初期データ
user = User.first
  document = user.documents.create!(
    title: '色々な日本語',
    description: '字体が違うものを文字認識',
    document_image:File.open("app/assets/images/OCR_sample_image/sample1.png")
  )
  user = User.first
  document = user.documents.create!(
    title: 'カタカナ',
    description: '字体が違うカタカナ文字認識',
    document_image:File.open("app/assets/images/OCR_sample_image/sample2.png")
  )

  user = User.first
  document = user.documents.create!(
    title: 'チェリー本',
    description: 'みんなの思い出がたくさん詰まったチェリー本',
    document_image:File.open("app/assets/images/OCR_sample_image/sample3.png")
  )
  user = User.first
  document = user.documents.create!(
    title: '英語',
    description: '字体が違う英語',
    document_image: File.open("app/assets/images/OCR_sample_image/sample4.png")
  )
  user = User.first
  document = user.documents.create!(
    title: 'レシート',
    description: 'たまご高騰',
    document_image:File.open("app/assets/images/OCR_sample_image/sample5.png")
  )


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
  name: 'Global Walkers株式会社',
  address: '東京都品川区西五反田2-25-2 飯嶋ビル5階',
  url: 'https://www.globalwalkers.co.jp/',
  established: '2016年6月1日',
  service: '機械学習（AI）と画像処理技術（コンピュータビジョン）',
  engineer: '非公開',
  provision: "クラウド",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.where(genre: ["画像処理", "自然言語処理", "音声認識処理", "時系列解析", "最適化処理"])
partner.costs << Cost.where(breakdown: ["100万以下", "100~300万", "300~500万", "500~2000万", "2000万以上"])
partner.service_contents << ServiceContent.where(division: ["AIコンサル", "AI受託開発", "アノテーションサービス", "データ分析", "AI関連製品", "AI導入サービス", "その他"])

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'アノテーションサービス Annotation One',
  content: 'https://annotation1.com/',
  image: File.open("./app/assets/images/Global Walkers.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: 'セントラル警備保障様 自律移動型警備ロボット向けAI物体検出システム開発',
  content: 'https://prtimes.jp/main/html/rd/p/000000015.000027037.html',
  image: File.open(Rails.root.join("app/assets/images/Global Walkers2.png")),
  partner: partner
)

# 3社目
Partner.create!(
  name: '株式会社 Ridge-i (リッジアイ）',
  address: '〒100-0004 東京都千代田区大手町1-6-1 大手町ビル438',
  url: 'https://ridge-i.com/',
  established: '2016年7月29日',
  service: '・AI・ディープラーニング技術のコンサルティングおよび開発
  ・共同事業、ライセンス、保守モデル、自社開発等によるプロダクトの提供
  ・人工衛星データを活用したAI解析ソリューションの提供',
  engineer: '非公開',
  provision: "クラウド",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.where(genre: ["画像処理", "時系列解析", "最適化処理"])
partner.costs << Cost.where(breakdown: ["100万以下", "100~300万", "300~500万", "500~2000万", "2000万以上"])
partner.service_contents << ServiceContent.where(division: ["AIコンサル", "AI受託開発", "データ分析", "AI導入サービス"])

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'DEEP SPACE',
  content: 'https://deep-space.ridge-i.com/',
  image: File.open("./app/assets/images/Ridge-i.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: 'ごみ焼却施設におけるごみ種別認識AI自動運転クレーン開発',
  content: 'https://ridge-i.com/project/3145/',
  image: File.open("./app/assets/images/Ridge-i2.png"),
  partner: partner
)

# 4社目
Partner.create!(
  name: 'EAGLYS株式会社（イーグリス）',
  address: '〒151-0051
  東京都渋谷区千駄ヶ谷5丁目27-3
  やまとビル7F',
  url: 'https://eaglys.co.jp/',
  established: '2016年12月',
  service: '
  「秘密計算を中心としたセキュアコンピューティング技術」を生かしたデータセキュリティ/データ利活用サービス
  秘密計算ソフトウェア「DataArmor（データアーマー）」シリーズの開発、販売
  「AIアルゴリズム設計・解析技術」によるAI開発/解析サービス',
  engineer: '10名',
  provision: "クラウド",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.where(genre: ["画像処理", "自然言語処理", "最適化処理"])
partner.costs << Cost.where(breakdown: ["300~500万"])
partner.service_contents << ServiceContent.where(division: ["AIコンサル", "AI受託開発", "データ分析", "AI関連製品", "AI導入サービス"])

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'DataArmor Gate AI',
  content: 'https://www.eaglys.co.jp/use-case/ai-analysis-image/',
  image: File.open("./app/assets/images/EAGLYS.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: '顧客独自のAI画像認識モデルを設計し、商品認識精度を向上。物流センター無人化に貢献。',
  content: 'https://ridge-i.com/project/3145/',
  image: File.open("./app/assets/images/EAGLYS2.png"),
  partner: partner
)

# 5社目
Partner.create!(
  name: '株式会社システムズナカシマ',
  address: '岡山市東区上道北方688-1',
  url: 'https://www.systems.nakashima.co.jp/contents/',
  established: '1985年年4月1日',
  service: '「建築設備用CADシステムの開発/販売
  建築設備業向け顧客管理システムの開発/販売
  営業情報管理システムの開発/販売
  スマートフォン向け各種ソフトの開発/販売
  業務システムの開発・販売 / コンピュータ関連機器の販売',
  engineer: '60名',
  provision: "クラウド",
  user: User.first # ユーザーIDを指定する
)

# ai_categories, costs, service_contentsテーブルのデータを追加
partner = Partner.last
partner.ai_categories << AiCategory.where(genre: ["画像処理"])
partner.costs << Cost.where(breakdown: ["500~2000万", "2000万以上"])
partner.service_contents << ServiceContent.where(division: ["AIコンサル", "AI受託開発", "アノテーションサービス", "AI関連製品", "AI導入サービス"])

# product_infosテーブルのデータを追加
ProductInfo.create!(
  name: 'Roboflow',
  content: 'https://www.systems.nakashima.co.jp/rf/roboflow/',
  image: File.open("./app/assets/images/システムズナカシマ.png"),
  partner: partner
)
# CaseStudyレコードを作成
CaseStudy.create!(
  name: '図面からの物体検出を利用した、積算業務用の数量の拾い出し',
  content: 'https://www.systems.nakashima.co.jp/setsubi/hiroinotakumi-ai/',
  image: File.open("./app/assets/images/システムズナカシマ2.png"),
  partner: partner
)
