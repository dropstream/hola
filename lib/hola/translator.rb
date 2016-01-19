class Hola::Translator
  def initialize(language = "english")
    @language = language
  end

  def hi
    case @language
    when "spanish"
      "hola mundo"
    when "korean"
      "anyoung ha se yo"
    when "polish"
      "witaj świecie"      
    when "german"
       "hallo welt"
    when "brazilian portuguese"
       "olá mundo"
    when "chinese"
      "你好，世界"          
    else
      "hello world"
    end
  end
end
