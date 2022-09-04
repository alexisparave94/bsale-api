class BsaleService
  def initialize
    @host = "mdb-test.c6vunyturrl6.us-west-1.rds.amazonaws.com"
    @database = "bsale_test"
    @username = "bsale_test"
    @password = "bsale_test"
    @client = Mysql2::Client.new(
      host: @host,
      username: @username,
      database: @database,
      password: @password
    )
  end

  def list_products
    @products = @client.query(
      "SELECT p.id, p.name, p.url_image, p.price, p.discount, c.name as cat_name
        FROM product as p
        JOIN category as c
        ON p.category = c.id
        ORDER BY p.id;"
    )
  rescue StandardError => e
    Rails.logger.debug e.message
    @products = e
  ensure
    @client&.close
    Rails.logger.debug "Done."
  end

  def filter_products(id)
    @products = @client.query(
      "SELECT
        p.id,
        p.name,
        p.url_image,
        p.price,
        p.discount,
        c.name as cat_name
        from product as p
        JOIN category as c
        ON p.category = c.id
        WHERE p.category = #{id};"
    )
  rescue StandardError => e
    Rails.logger.debug e.message
    @products = e
  ensure
    @client&.close
    Rails.logger.debug "Done."
  end

  def list_categories
    @categories = @client.query("SELECT * FROM category;")
  rescue StandardError => e
    Rails.logger.debug e.message
    @products = e
  ensure
    @client&.close
    Rails.logger.debug "Done."
  end

  def search(query)
    @products = @client.query("SELECT * FROM product WHERE LOWER(name) like '%#{query}%';")
  rescue StandardError => e
    Rails.logger.debug e.message
    @products = e
  ensure
    @client&.close
    Rails.logger.debug "Done."
  end
end
