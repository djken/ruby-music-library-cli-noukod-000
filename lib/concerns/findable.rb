module Concerns::Findable

  def find_by_name(f_name) # Allow to find an instance of the class by name.
     all.detect do |song_dectect|
       song_dectect.name == f_name
     end
  end

  def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end
end
