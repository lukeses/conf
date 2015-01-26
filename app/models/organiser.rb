class Organiser < ActiveRecord::Base
  has_many :event_organisers, inverse_of: :organiser
  has_many :events, through: :event_organisers
  has_many :tasks


 filterrific(
  default_settings: { sorted_by: 'created_at_desc' },
  filter_names: [
    :search_query,
    :sorted_by,
    :with_country_id,
    :with_created_at_gte
  ]
)


scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("organisers.created_at #{ direction }")
  when /^name_/
    # Simple sort on the name colums
    order("LOWER(organisers.name) #{ direction }, LOWER(organisers.surname) #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

  scope :with_country_id, lambda { |country_ids|
  	where(id: country_ids)
  }
  scope :with_created_at_gte, lambda { |ref_date|
  	where(id: ref_date)
  }

scope :search_query, lambda { |query|
  return nil  if query.blank?
  terms = query.downcase.split(/\s+/)
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(organisers.surname) LIKE ? OR LOWER(organisers.name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
}


# app/models/student.rb
def self.options_for_sorted_by
  [
    ['Name (a-z)', 'name_asc'],
    ['Registration date (newest first)', 'created_at_desc'],
    ['Registration date (oldest first)', 'created_at_asc']
  ]
end

# # app/models/country.rb
# def self.options_for_select
#   order('LOWER(name)').map { |e| [e.name, e.id] }
# end




end
