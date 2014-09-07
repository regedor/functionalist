module Functionalist
  module PointFree
    module Operator

      def self.caculate(left, right)
        receiver, value        = left
        method_and_args, block = right
	      #puts "#{reciever.inspect} >> ##{method_and_args}"

        a = case method_and_args.first
        when :point_free_itself
          left

        when :point_free_map
          [receiver.map(&method_and_args[1]), nil]

        when :point_free_split
          [method_and_args[1..-1].map {|x| x.to_proc.call(receiver)}, nil]

        when :point_free_change_receiver
          [method_and_args[1],receiver]

        when :point_free_inject_args
          #[method_and_args[1],receiver]

        else #:point_free_concatenate
          method_and_args = [method_and_args[0]] + [value] if value

          [receiver.send(*method_and_args, &block), nil]

        end

         #puts a.inspect ;puts
	       return a
      end

    end
  end
end

