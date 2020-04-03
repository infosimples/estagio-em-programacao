class SimpleStore

  PRODUCT_TYPES = {
    :Product => 0,
    :DigitalProduct => 1,
    :FreshProduct => 2,
    :PhysicalProduct => 3
  }

  AUTHORIZED_MANUFACTURERS = {
    # Digital products
    :OReillyMedia => 0,
    :Microsoft => 1,

    # Physical products
    :Sony => 2,
    :Apple => 3,
    :Unilever => 4,

    # Fresh products
    :ProdutosMaeTerra => 5,
    :PlanetaOrganico => 6,
    :SaborNatural => 7
  }

  class Error < RuntimeError; end

end
