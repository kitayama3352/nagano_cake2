class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @quantity = Item.count # quantity => 総量/.count =>カウントメソッド、配列の要素の数を数えるための機能
    @genres = Genre.where(valid_invalid_status: 0) # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(valid_invalid_status: 0)
  end

end
