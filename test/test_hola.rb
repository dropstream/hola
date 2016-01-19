require 'test/unit'
require 'hola'

class HolaTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "hello world", Hola.hi("english")
  end

  def test_any_hello
    assert_equal "hello world", Hola.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "hola mundo", Hola.hi("spanish")
  end

  def test_german_hello
     assert_equal "hallo welt", Hola.hi("german")
  end
    
  def test_brazilian_portuguese_hello
    assert_equal "olá mundo", Hola.hi("brazilian portuguese")
  end 

  def test_chinese_hello
    assert_equal "你好，世界", Hola.hi("chinese")
  end     
  
  def test_latin_hello
    assert_equal "salve", Hola.hi("latin")
  end

  def test_polish_hello
    assert_equal "witaj świecie", Hola.hi("polish")
  end   
end
