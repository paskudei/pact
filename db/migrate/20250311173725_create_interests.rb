# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[8.0]
  def change
    create_table :interests do |t|
      t.string :name

      t.timestamps
    end
  end
end
