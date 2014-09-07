class String

  OPERATOR_AFTER = ' < '

  def r(receiver)
    @point_free_receiver = receiver
  end


  def args(*array)
    @point_free_args = array
  end


  def to_proc
    parse_expression(self)
    expression.to_proc
  end


  private

  def expression
    @expression ||= Functionalist::PointFree::Expression.new
  end

  def parse_expression(exp)
    # carimbar
    exp.strip.split(OPERATOR_AFTER).reverse.each do |sub_exp|
      # descarimbar
      next if parse_functionalist_method(expression, sub_exp)

      _, receiver_string, method_name, args_string = /(\w*\.)?(\w+)(\(.*\))?/.match(sub_exp).to_a
      parse_receiver expression, receiver_string
      parse_args expression, args_string
      expression.send method_name
    end
  end


  def parse_receiver(expression, receiver_string)
    expression.point_free_reciever(receiver_string) if receiver_string
  end


  def parse_args(expression, args_string)
    expression.point_free_inject_args(args_string) if args_string
  end

  def parse_functionalist_method(expression, exp)

  end


end
