namespace :todo do
  desc "Deletes items older than 7 days"
  task delete_items: :environment do
    items = Item.where("created_at <= ?", Time.now - 7.days)
    number = items.count 
    puts "#{number} items deleted." if items.destroy_all 
  end
end
