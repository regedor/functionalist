module StringExtensions

  OPERATOR_AFTER = ' < '

  def r(receiver)
    @point_free_receiver = receiver
  end

  def args(*args)
    @point_free_args = args
  end


  def point

  def to_proc
    self.strip.split(OPERATOR_AFTER).reverse.each do |node|
      parse node


    end
  end


  private

  def expression
    @@expression ||= Functionalist::PointFree::Expression.new
  end

end