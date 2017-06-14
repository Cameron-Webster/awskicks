class AddScrapeTypeToLogo < ActiveRecord::Migration[5.0]
  def change
    add_column :logos, :scraper, :string
  end
end
