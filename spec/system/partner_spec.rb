require 'rails_helper'

RSpec.describe Partner, type: :system do

let!(:user) { FactoryBot.create(:secound_user)}
  def login
    visit new_user_session_path
    fill_in 'user[name]', with: 'takayuki'
    fill_in 'user[email]', with: 'takayuki@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'commit'
  end

  describe '会社情報の登録機能' do
    context '会社情報が正常に登録された場合' do
      it '確認画面を経由して会社情報確認画面に移動できて、問題なければ、登録して会社一覧画面に移動できる' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: '会社名'
        fill_in 'partner[address]', with: '住所'
        fill_in 'partner[url]', with: '会社URL'
        fill_in 'partner[established]', with: '会社設立年'
        fill_in 'partner[engineer]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "製品情報", content: "製品情報1", partner_id: 1)
        product_info.save
        case_study = CaseStudy.new(name: "導入事例１", content: "導入事例の内容", partner_id: 1 )
        case_study.save
        click_on '保存'
        expect(page).to have_content '以下の内容で、送信する。'
        partner = Partner.last
        click_link('search_btn_3')
        sleep(1)
        expect(page).to have_content '会社一覧'
      end
    end
    context '会社情報の会社名が登録されてない場合' do
      it '確認画面に移動できない' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: ''
        fill_in 'partner[address]', with: '所在地'
        fill_in 'partner[url]', with: '会社URL'
        fill_in 'partner[established]', with: '会社設立年'
        fill_in 'partner[engineer]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "製品情報", content: "製品情報1", partner_id: 1)
        product_info.save 
        case_study = CaseStudy.new(name: "導入事例１", content: "導入事例の内容", partner_id: 1 )
        case_study.save
        click_on '保存'
        expect(page).to have_content 'があります'
        expect(page).to have_content 'Nameを入力してください'
      end
    end
    context '会社情報の所在地が登録されてない場合' do
      it '確認画面に移動できない' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: '会社名'
        fill_in 'partner[address]', with: ''
        fill_in 'partner[url]', with: '会社URL'
        fill_in 'partner[established]', with: '会社設立年'
        fill_in 'partner[engineer]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "製品情報", content: "製品情報1", partner_id: 1)
        product_info.save 
        case_study = CaseStudy.new(name: "導入事例１", content: "導入事例の内容", partner_id: 1 )
        case_study.save
        click_on '保存'
        expect(page).to have_content '1 errorがあります。'
        expect(page).to have_content 'Addressを入力してください'
      end
    end
    context '会社情報の会社URLが登録されてない場合' do
      it '確認画面に移動できない' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: '会社名'
        fill_in 'partner[address]', with: '所在地'
        fill_in 'partner[url]', with: ''
        fill_in 'partner[established]', with: '会社設立年'
        fill_in 'partner[engineer]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "製品情報", content: "製品情報1", partner_id: 1)
        product_info.save 
        case_study = CaseStudy.new(name: "導入事例１", content: "導入事例の内容", partner_id: 1 )
        case_study.save
        click_on '保存'
        expect(page).to have_content '1 errorがあります。'
        expect(page).to have_content 'Urlを入力してください'
      end
    end
    context '会社情報の会社設立年が登録されてない場合' do
      it '確認画面に移動できない' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: '会社名'
        fill_in 'partner[address]', with: '所在地'
        fill_in 'partner[url]', with: '会社URL'
        fill_in 'partner[established]', with: ''
        fill_in 'partner[engineer]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "製品情報", content: "製品情報1", partner_id: 1)
        product_info.save 
        case_study = CaseStudy.new(name: "導入事例１", content: "導入事例の内容", partner_id: 1 )
        case_study.save
        click_on '保存'
        expect(page).to have_content '1 errorがあります。'
        expect(page).to have_content 'Establishedを入力してください'
      end
    end
  end
end




