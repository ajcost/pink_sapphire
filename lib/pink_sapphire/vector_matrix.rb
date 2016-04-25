module PinkSapphire
  class VectorMatrix
    attr_reader :matrix, :n, :m, :random

    def initialize(n, m, random)
      @n = n
      @m = m
      @random = random
      @matrix = Array.new(n) { Array.new(m) }
      for i in 0..n - 1
        for j in 0..m - 1
          if random
            @matrix[i][j] = 1.0 * rand(0...2)
          else
            @matrix[i][j] = 1.0
          end
        end
      end
    end

    def apply_value(x)
      @matrix = Array.new(@n) { Array.new(@m, x) }
    end

    def apply_array(x)
      raise ArgumentError, "Input must be of type two dimensional Array" if !x.kind_of? Array
      @matrix = x
    end

    def to_array
      @matrix
    end

    def set_value(i, j, x)
      @matrix[i][j] = x
    end

    def get_value(i, j)
      @matrix[i][j]
    end

    def get_i_vector_size
      @matrix.size
    end

    def get_j_vector_size
      @matrix[0].size
    end
  end
end
