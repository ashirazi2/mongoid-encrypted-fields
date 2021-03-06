#
# Used to store an encrypted time in Mongo
#
# Usage:
# field :birth_date, type: Mongoid::EncryptedDate
#
# Set with an unencrypted date
# p = Person.new()
# p.birth_date = Date.new(2000, 1, 1)
#
# Get returns the unencrypted date
# puts p.birth_date -> 'Jan 1, 2000'
#
# Use the encrypted property to see the encrypted value
# puts p.birth_date.encrypted -> '....'
#
module Mongoid
  class EncryptedTime < ::Time
    include Mongoid::EncryptedField

    class << self

      def from_time(time)
        parse(time.to_s)
      end

      def convert(object)
        from_time(object.to_time)
      end

    end
  end
end