require 'rails_helper'
RSpec.describe 'タスク管理', type: :system do
  describe do
    context 'トップページが表示されている' do
      it 'トップページにはじめるボタンが表示されている' do
        visit root_path
        expect(page).to have_content('はじめる'), 'はじめるボタンがトップページに表示されていません'
        expect(page).to have_content('はじめる'), 'トップページにはじめるボタンが表示されていません'
      end

      it 'タスクページに戻るボタンが表示されている' do
        visit '/tasks'
        expect(page).to have_content('戻る'), 'タスクページに戻るボタンが表示されていません'
      end

      it 'トップページからタスクページに遷移できる' do
        visit root_path
        click_link 'はじめる'
        expect(current_path).to eq('/tasks'), 'タスクページに遷移できていません'
      end

      it 'タスクページからトップページに遷移できる' do
        visit '/tasks'
        click_link '戻る'
        expect(current_path).to eq('/'), 'トップページに遷移できていません'
      end
    end
  end
end