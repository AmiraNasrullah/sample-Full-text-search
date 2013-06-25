class Toy < ActiveRecord::Base

  attr_accessible :brande, :category, :child_age, :inserted_at, :name, :price

  include Tire::Model::Search
 	include Tire::Model::Callbacks

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :brande,        :index    => :not_analyzed
    indexes :category,      :index    => :not_analyzed
    indexes :inserted_at, :type => 'date', :include_in_all => false
    indexes :price,      :type => 'integer',   :index => :not_analyzed
    indexes :child_age,      :type => 'integer',   :index => :not_analyzed


  end


  def self.search(params)
    tire.search(load: true) do
        query{all}
                 
        filter :term, brande: params[:brande] if params[:brande].present?
        filter :term, category: params[:category] if params[:category].present?
        filter :range, price: { :from => params[:pricel], :to => params[:priceh] } if params[:pricel].present?
        filter :range, child_age: { :from => params[:agel], :to => params[:ageh] } if params[:agel].present?
        sort  { by :inserted_at, :desc }

    end
  end

end
