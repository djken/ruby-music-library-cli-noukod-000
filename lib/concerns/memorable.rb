module Concerns::Memorable
  # module ClassMethods
    def destroy_all
      self.all.clear
    end
end
