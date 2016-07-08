class Definition

  define_method(:initialize) do | attributes |
    @definition = attributes.fetch(:definition)
  end
end
