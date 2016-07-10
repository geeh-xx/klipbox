require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def test_article

    article = Article.new(:title => "Rangel", :text => "gmail")
    msg = "Noticia não salvo"+ "Erros: ${article.errors.inspect}"
    assert article.save, msg

    article_copy = Article.find(article.id)

    assert_equal article.title,  article_copy.title

    Article.delete(article)

  end
end
