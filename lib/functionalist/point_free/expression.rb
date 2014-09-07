module Functionalist
  module PointFree
   class Expression 

     undef_method(*(instance_methods.map(&:to_sym) - [:__id__, :__send__, :object_id]))


     def initialize
       @methods = []
     end

     #def _(reciever)
     #  self.functionalist_point_free_change_reciever(reciever)
     #end


     def method_missing(*method_and_args, &block)
       @methods << [method_and_args, block] unless method_and_args == [:respond_to?, :to_proc]
       self
     end


     def to_proc
       lambda do |obj|
         reciever, value = @methods.inject(obj) do |left, right|
           Functionalist::PointFree::Operator.caculate(left, right)
         end
         reciever
       end
     end

     def queue 
      @methods
    end

   end
  end
end

