require 'test_helper'

class FunctionalistTest < Test::Unit::TestCase
  LIST = %w[1 2 3 4 5 6 7 8 9 10]


  def test_point_free_concatenation
    traditional  = LIST.map { |x| x.to_i.to_s }

    pointfree    = LIST.map &point_free.to_i.to_s

    #functionalist = LIST.map &'.to_s < .to_i'

    assert_equal traditional, pointfree
    #assert_equal traditional, functionalist
  end


  def test_point_free_change_receiver
    traditional  = LIST.map { |x| Calculus.add_3(x.to_i) }

    pointfree    = LIST.map &point_free.to_i.point_free_change_receiver(Calculus).add_3

    #functionalist = LIST.map &'.to_i + Calculus.add_3'.
    #functionalist = LIST.map &'.to_i + add_3'.r(Calculus)

    assert_equal traditional, pointfree
    #assert_equal traditional, functionalist
  end


  def test_point_free_split
    traditional  = LIST.map { |x| [Calculus.add_3(x.to_i), Calculus.add_4(x.to_i), x.to_i] }

    pointfree    = LIST.map &point_free.to_i.point_free_split(
      point_free.point_free_change_receiver(Calculus).add_3,
      point_free.point_free_change_receiver(Calculus).add_4,
      point_free.point_free_itself
    )

    #functionalist = LIST.map &'.to_i + [add_3, add_4, itself]'.r(Calculus)

    assert_equal traditional, pointfree
    #assert_equal traditional, functionalist
  end

  def test_point_free_map
    traditional  = LIST.map { |x| [Calculus.add_3(x.to_i), Calculus.add_4(x.to_i)].map(&:to_s) }

    pointfree    = LIST.map &point_free.to_i.point_free_split(
      point_free.point_free_change_receiver(Calculus).add_3,
      point_free.point_free_change_receiver(Calculus).add_4
    ).point_free_map(point_free.to_s)

    #functionalist = LIST.map &'.to_i + [add_3, add_4] + map(.to_s)'.r(Calculus)

    assert_equal traditional, pointfree
    #assert_equal traditional, functionalist
  end


  #functionalist = LIST.map &'.to_i + [add_3, add_5 + times(3,_)] + map(.to_s)'.r(Calculus)

  #functionalist = LIST.map &'.to_i+[add_3,Calculus.add_5+times(x,_)]+map(.to_s)'.r(Calculus).args(9)


  #should 'concating methods' do
  #  a = %w[1 2 3 4 5 6 7 8 9 10]

  #  old_way = a.map { |x| add_3(x.to_i).to_s }
  #  new_way = a.map &point_free(self).to_i..add_3.to_s

  #  #new_way = a.map &F(self).to_i.R_add_3.to_s

  #  F(self).
  #    add_3.
  #    add_7.
  #    add_7(1,2,3)

  #  F(self).
  #    clean_text.
  #    find_names.
  #    best_name.
  #    count.
  #    plus(3,:_)


  #    %f[]  clean_text.
  #      find_names.
  #      best_name.
  #      count.
  #      plus(3,:_)

  #  assert_equal old_way, new_way
  #end

 #def clean_text(text)
  # text
 #end

  #def find_names(text)
  #  ["",""]
  #end

  #def best_name(a)
  #  a.first
  #end


  #point_free.r(self).add1.slipt( point_free.r_self )

  #l.map &%w[ add1 -> split((add_4 -> add1) ,add_3) ]


  #def pimba(x)
  #  l.map &%w[ add1 -> split((add_4 -> add1) ,add_3) ]

  #  l.map &%w[ add1 -> split((add_4 -> add1) ,add_3) ]

  #  l.map &%w[ add1 -> (.odd? ? add_4 : add1 ]

  #  l.map &%w[ .to_s -> .strip -> .add_3 ]

  #  x.to_s.strip.add_3


  #  l.map { |x| [add4(add1(x)),add5(add1(x))] }
  #end

  #def pimba(x)
  #  l.map do |x|
  #    v = add1(x)
  #    [add4(v),add5(v)]
  #  end


  #  end


  #  v = add1(x)
  #  [add4(v),add5(v)]
  #end



  #def add_1(x)
  #  x + 3
  #end

  #def add_4(x)
  #  x + 3
  #end

  #def add_3(x)
  #  x + 3
  #end

end