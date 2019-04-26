module Concerns::Memorable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
