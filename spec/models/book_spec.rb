require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Book#title_with_author" do # describeメソッドをつかってメソッドごとに区切ると読みやすいです
    before do
      @book = Book.new(title: "RubyBook", author: "matz")
    end
    it "Book#title_with_authorを呼び出したとき、titleとauthorを結んだ文字列が返ること" do
      expect(@book.title_with_author).to eq("RubyBook - matz")
    end
    it "bookの情報が取得できること" do
      expect(@book.title).to eq("RubyBook")
      expect(@book.author).to eq("matz")
      expect(@book.title_with_author).to eq("RubyBook - matz")
    end
    context "Book#titleが文字列のとき" do # 状況を説明する
      it "titleとauthorを結んだ文字列が返ること" do
        expect(@book.title_with_author).to eq("RubyBook - matz")
      end
    end
  end
  describe "Book#bonus" do
    context "lucky?がtrueのとき" do
      it "チェキが返ること" do
        book = Book.new
        allow(book).to receive(:lucky?).and_return(true) # モック化
        expect(book).to receive(:lucky?) # 確認するメソッド呼び出しを実行する前に書く
        expect(book.bonus).to eq("著者サイン入りチェキ")
      end
    end
  end
  describe "Book#take_pictures" do
    context "呼び出すとき" do
      it "例外が投げられること" do
        book = Book.new
        expect{ book.take_pictures }.to raise_error(RuntimeError, "写真撮影はご遠慮ください")
      end
    end
  end
end
