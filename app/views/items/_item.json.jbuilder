json.extract! item, :id, :title, :price
json.url item_url(item, format: :json)
json.category item.category.title
json.price_rur item.price * 60

json.date I18n.l(Time.now)

json.author do
  json.name "Ivan"
end
