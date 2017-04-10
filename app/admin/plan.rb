# frozen_string_literal: true
ActiveAdmin.register Plan do
  permit_params :hidden

  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :stripe_id
    column :name
    column :amount
    column :interval
    column :created_at
    column :updated_at
    column :hidden
    actions
  end

  filter :name
  filter :stripe_id
  filter :hidden

  form do |f|
    f.inputs 'Plan details' do
      f.input :hidden
    end
    f.actions
  end
end
