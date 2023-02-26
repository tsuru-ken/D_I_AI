require 'rails_helper'

RSpec.describe Document, type: :system do

  def login
    visit new_user_session_path
    fill_in 'user[name]', with: 'mitsue'
    fill_in 'user[email]', with: 'mistue@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'commit'
  end

  describe '会社情報の登録機能' do
    context '会社情報が正常に登録された場合' do
      it '確認画面を経由して会社情報確認画面に移動できる' do
        login
        visit new_partner_path
        sleep(1)
        fill_in 'partner[name]', with: '会社名'
        fill_in 'partner[address]', with: '住所'
        fill_in 'partner[url]', with: '会社URL'
        fill_in 'partner[established]', with: '技術者数'
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_ai_category_labels').find do |fk|
          fk.to_table == 'ai_categories'
        end , {with: '画像処理'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_cost_labels').find do |fk|
          fk.to_table == 'costs'
        end ,{with: '100万以下'}
        foreign_key = ActiveRecord::Base.connection.foreign_keys('partner_service_content_labels').find do |fk|
          fk.to_table == 'service_contents'
        end ,{with: 'AIコンサル'}
        product_info = ProductInfo.new(name: "example", content: "example", partner_id: 1)
        product_info.save ,{with: '100万以下'}
        case_study = CaseStudy.new(name: "example", content: "example", partner_id: 1)
        case_study.save
        click_on '保存'

        expect(page).to have_content '以下の内容で、送信する。'
        partner = Partner.last
        click_link('search_btn_3')
        sleep(1)
        expect(page).to have_content '会社一覧'
      end
    end
  end
end




