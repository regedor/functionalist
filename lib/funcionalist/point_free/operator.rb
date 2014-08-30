module Funcionalist
  module PointFree
    module Operator

      #PREFIX = 'funcionalist_point_free_'
      #VALID = [:change_reciever]
    

      def self.caculate(left, right)
        reciever, value        = left
        method_and_args, block = right

	puts "#{reciever.inspect} >> ##{method_and_args}"

        a = case method_and_args.first
        when :funcionalist_point_free_change_reciever
          [method_and_args[1],reciever]

        else #funcionalist_point_free_concat
          method_and_args = [method_and_args[0]] + [value] if value

          [reciever.send(*method_and_args, &block), nil]

        end

        puts a.inspect ;puts
	return a
      end

    end
  end
end

