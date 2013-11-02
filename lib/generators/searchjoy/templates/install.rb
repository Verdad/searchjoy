class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    create_table :searchjoy_searches do |t|
      t.string :search_type
      t.string :query
      t.string :normalized_query
      t.integer :results_count
      t.timestamp :created_at
      t.integer :convertable_id
      t.string :convertable_type
      t.timestamp :converted_at
    end

    add_index :searchjoy_searches, [:created_at]
    add_index :searchjoy_searches, [:search_type, :created_at]
    add_index :searchjoy_searches, [:search_type, :normalized_query, :created_at], name: "index_searchjoy_searches_on_search_type_and_normalized_query_an" # autogenerated name is too long
    add_index :searchjoy_searches, [:convertable_id, :convertable_type]
  end
end
